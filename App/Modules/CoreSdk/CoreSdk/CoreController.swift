//
//  CoreController.swift
//  CoreSdk
//
//  Created by phu nguyen on 2/22/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class CoreController: NSObject {
    private let videoIdentControllerClassName = "VideoIdentController"
    private let autoIdentControllerClassName  = "AutoIdentController"
    private let coreSDKName                   = "Core SDK"
    private let coreStoryboard = UIStoryboard(name: "CoreStoryboard", bundle: Bundle(for: CoreController.self))
    private var hostAppController: UIViewController?
    private var transactionToken: String?
    private var videoIdentController: NSObject?
    private var autoIdentController: NSObject?
    
    public static let shared: CoreController = CoreController()
    
    public override init() {
        print("Initialized - CoreController")
    }
    
    public func initialize(withToken token: String, fromController controller: UIViewController) {
        hostAppController = controller
        transactionToken  = token
        let coreInfoController = coreStoryboard.instantiateViewController(withIdentifier: String(describing: CoreInfoViewController.self))
        coreInfoController.title = coreSDKName
        controller.navigationController?
            .pushViewController(coreInfoController, animated: true)
    }
    
    public func presentVideoIdentController(_ controller: UIViewController?) {
        if let theVideoClass = CoreUtils.getClass(fromClassName: videoIdentControllerClassName) {
            videoIdentController = (theVideoClass as! NSObject.Type).init()
            videoIdentController!.perform(Selector(("initialize:controller:")), with: transactionToken ?? "", with: controller ?? hostAppController)
        } else {
            CoreUtils.showAlert(coreSDKName, message: "Invalid -- Plz including Video SDK in your application", fromController: controller ?? hostAppController)
        }
    }
    
    public func presentAutoIdentController() {
        if let theAutoIdentClass = CoreUtils.getClassInFramework(fromClassName: autoIdentControllerClassName) {
            autoIdentController = (theAutoIdentClass as! NSObject.Type).init()
            autoIdentController!.perform(Selector(("initialize:controller:")), with: transactionToken ?? "", with: hostAppController)
        } else {
            CoreUtils.showAlert(coreSDKName, message: "Invalid -- Plz including AutoIdent SDK in your application", fromController: nil)
        }
    }
    
    public func closeCurrentWindow() {
        
    }
    
    public func getTransactionToken() -> String {
        return transactionToken ?? ""
    }
    
    
    
}

