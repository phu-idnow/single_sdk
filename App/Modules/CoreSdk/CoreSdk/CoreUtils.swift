//
//  CoreUtils.swift
//  CoreSdk
//
//  Created by phu nguyen on 2/22/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

public class CoreUtils {
    
    public static func showAlert(_ title: String?, message: String?, fromController controller: UIViewController?) {
        let _controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
        guard let _con = _controller else { return }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(action)
        _con.present(alertController, animated: true, completion: nil)
    }
    
    public static func presentController(fromClassName name: String) -> Bool {
        guard let aClass = NSClassFromString(name) else {
            print("\(name) -- invalid")
            return false
        }
        print("\(aClass) is valid ---- \(name)")
        return true
    }
    
    public static func getClassInFramework(fromClassName name: String) -> AnyClass? {
        let allFrameworks = Bundle.allFrameworks
        
        for f in allFrameworks {            
            if let frameworkName = f.infoDictionary?["CFBundleExecutable"] {                
                let className = "\(frameworkName).\(name)"
                if let theClass = NSClassFromString(className) {
                    return theClass
                }
            }
        }

        return nil
    }
    
    public static func getClass(fromClassName name: String) -> AnyClass? {
        if let theClass = NSClassFromString(name) {
            return theClass
        }
        
        return nil
    }
}
