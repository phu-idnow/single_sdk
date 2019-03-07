//
//  AutoIdentController.swift
//  AutoIdentSdk
//
//  Created by phu nguyen on 2/22/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit
import CoreSdk

public class AutoIdentController: NSObject {
    
    private var fromController: UIViewController?
    public override init() {
        print("Initialized - AutoIdentController")
    }
    
    @objc public func initialize(_ token: String, controller: UIViewController) {
        fromController = controller
        let viewController = AutoIdentViewController()
        viewController.token = token
        controller.present(viewController, animated: true, completion: nil)
    }
    
}



class AutoIdentViewController: UIViewController {
    var token: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "AutoIdentSdk"        
        
        let titleLabel = UILabel()
        titleLabel.text = "Welcome to AutoIdentSdk \nStarting AutoIdent flow with token: \(token)"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        let orangeColor = UIColor(red: 249.0/255, green: 86.0/255, blue: 1.0/255, alpha: 1.0)
        
        let button = UIButton(type: .custom)
        button.setTitle("Launch VideoSDK", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = orangeColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let closeButton = UIButton(type: .custom)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(UIColor.white, for: .normal)
        closeButton.backgroundColor = orangeColor
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(button)
        view.addSubview(closeButton)
        
        view.addConstraints([
            NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 30),
            NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: -30),
            NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0),
            ])
        titleLabel.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 100.0))
        
        view.addConstraints([
            NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: -20),
            NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.5, constant: 1.0)
            ])
        
        view.addConstraints([
            NSLayoutConstraint(item: closeButton, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 20),
            NSLayoutConstraint(item: closeButton, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 30),
            NSLayoutConstraint(item: closeButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.2, constant: 1.0)
            ])
        
        button.addTarget(self, action: #selector(AutoIdentViewController.launchVideoSDK(_:)), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(AutoIdentViewController.closeCurrentWindow(_:)), for: .touchUpInside)
    }
    
    
    @objc func launchVideoSDK(_ sender: UIButton) {
        CoreController.shared.presentVideoIdentController(self)
    }
    
    @objc func closeCurrentWindow(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
