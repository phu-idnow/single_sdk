//
//  ViewController.swift
//  IdnowApp
//
//  Created by phu nguyen on 2/20/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit
import IdnowSdk

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    private let singleIdnowSdk = IdnowSDK.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startIdentification(_ sender: UIButton) {
        
        singleIdnowSdk.initialize(withToken: textField.text ?? "", fromController: self)
    }
    
}

