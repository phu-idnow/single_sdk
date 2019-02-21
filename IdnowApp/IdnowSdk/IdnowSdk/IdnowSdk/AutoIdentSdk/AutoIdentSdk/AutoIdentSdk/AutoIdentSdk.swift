//
//  AutoIdentSdk.swift
//  AutoIdentSdk
//
//  Created by phu nguyen on 2/20/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit
import SnapKit

public class AutoIdentSdk: NSObject {
    public override init() {
        print("Initialized - AutoIdentSdk");
    }
    
    public func initialize(withToken token: String, fromController controller: UIViewController) {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        viewController.title = "AutoIdentSdk"
        
        let titleLabel = UILabel()
        titleLabel.text = "AutoIdentSdk with \(token)"
        
        viewController.view.addSubview(titleLabel);
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(viewController.view)
        }
        
        controller.navigationController?
            .pushViewController(viewController, animated: true)
    }
        
}
