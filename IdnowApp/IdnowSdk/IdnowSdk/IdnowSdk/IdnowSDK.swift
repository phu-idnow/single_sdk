//
//  IdnowSDK.swift
//  IdnowSdk
//
//  Created by phu nguyen on 2/20/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit
import AutoIdentSdk


public class IdnowSDK: NSObject {
    private let tempValueKey = "tempValueKey";
    
    private let autoIdent: AutoIdentSdk
    private let videoIdent: VideoIdentSdk
    
    public override init() {
        autoIdent = AutoIdentSdk.init()
        videoIdent = VideoIdentSdk.init()
        print("Initialized - IdnowSDK");
    }
    
    public func initialize(withToken token: String, fromController controller: UIViewController) {
        let userdefault = UserDefaults.standard
        let number = userdefault.integer(forKey: tempValueKey)
        if number % 2 == 0 {
            autoIdent.initialize(withToken: token, fromController: controller)
        } else {
            videoIdent.initialize(withToken: token, from: controller)
        }
        userdefault.set(number + 1, forKey: tempValueKey)
    }

}
