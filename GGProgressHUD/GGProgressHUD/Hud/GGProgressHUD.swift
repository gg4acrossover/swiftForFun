//
//  GGProgressHUD.swift
//  GGProgressHUD
//
//  Created by viethq on 5/5/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit
import

/// config
fileprivate let kRectProgressView = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)

final class GGProgressHUD {
    static let share = GGProgressHUD()
    fileprivate let GGProgressView : UIView = {
        let view = UIView(frame:kRectProgressView)
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 4.0
        view.center = CGPoint(x: UIScreen.main.bounds.width * 0.5,
                              y: UIScreen.main.bounds.height * 0.5)
        
        return view
    }()
    
    fileprivate let iconView : UIView = {
        let icon = NV
    }()
    
    fileprivate let keyWindow = UIApplication.shared.keyWindow
    fileprivate let window = UIWindow(frame: UIScreen.main.bounds)
    
    private init() {
        let container = GGHUDViewController()
        
        container.view.addSubview(self.GGProgressView)
        
        self.window.rootViewController = container
        
    }
}
