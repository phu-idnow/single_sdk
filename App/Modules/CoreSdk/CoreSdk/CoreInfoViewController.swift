//
//  CoreInfoViewController.swift
//  CoreSdk
//
//  Created by phu nguyen on 2/22/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

class CoreInfoViewController: UIViewController {
    @IBOutlet weak var tokenLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()        
        tokenLabel.text = CoreController.shared.getTransactionToken()
    }

    @IBAction func startA(_ sender: UIButton) {
        CoreController.shared.presentAutoIdentController()
    }
    
    @IBAction func startB(_ sender: Any) {
        CoreController.shared.presentVideoIdentController(nil)
    }
    
}
