//
//  ViewController.swift
//  IdnowApp
//
//  Created by phu nguyen on 2/20/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit
import CoreSdk

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    private let coreController = CoreController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _ = NSClassFromString("VideoIdentController") {
            print("hostapp - valid")
        } else {
            print("hostapp - invalid")
        }
        
//        let _ = VideoIdentController()
    }

    @IBAction func startIdentification(_ sender: UIButton) {
        guard let token = textField.text, token.count > 0 else {
            CoreUtils.showAlert("Host App", message: "Invalid token", fromController: self)
            return
        }
        coreController.initialize(withToken: token, fromController: self)
    }
    
}


