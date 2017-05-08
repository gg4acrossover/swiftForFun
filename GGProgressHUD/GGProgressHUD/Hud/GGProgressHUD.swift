//
//  GGProgressHUD.swift
//  GGProgressHUD
//
//  Created by viethq on 5/5/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

/// config
fileprivate let kRectProgressView = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
fileprivate let kRectIconView = CGRect(x: 0.0, y: 0.0, width: kRectProgressView.width * 0.5, height: kRectProgressView.height * 0.5)

class GGProgressHUD {
    //MARK: - Properties
    static let share = GGProgressHUD()
    
    var rootWindow : UIWindow?
    
    fileprivate let iconView : NVActivityIndicatorView
    fileprivate let keyWindow = UIApplication.shared.keyWindow
    fileprivate let window = UIWindow(frame: UIScreen.main.bounds)
    
    private let progressView : UIView = {
        let view = UIView(frame:kRectProgressView)
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 4.0
        view.center = CGPoint(x: UIScreen.main.bounds.width * 0.5,
                              y: UIScreen.main.bounds.height * 0.5)
        
        return view
    }()
    
    /// init of singleton
    private init() {
        // add icon to center of progress view
        self.iconView = NVActivityIndicatorView( frame: kRectIconView,
                                                 type: .audioEqualizer,
                                                 color: UIColor.red,
                                                 padding: 0.0)
        self.iconView.center = CGPoint( x: kRectProgressView.width * 0.5,
                                        y: kRectProgressView.height * 0.5)
        self.progressView.addSubview(self.iconView)
        
        // always show in center of view even when rotate
        // can use constraints instead
        self.progressView.autoresizingMask = [ .flexibleBottomMargin,
                                               .flexibleLeftMargin,
                                               .flexibleRightMargin,
                                               .flexibleTopMargin]
        
        // add progress to container which is a viewcontroller
        let container = GGHUDViewController()
        container.view.addSubview(self.progressView)
        self.window.rootViewController = container
    }
    
    //MARK: - Public method
    class func show() {
        GGProgressHUD.share.startAnim()
    }
    
    class  func hide() {
        GGProgressHUD.share.stopAnim()
    }
    
    //MARK: - Private method
    private func startAnim() {
        // save root window of app
        if let root = UIApplication.shared.keyWindow {
            self.rootWindow = root
        }
        
        self.window.alpha = 0
        self.window.makeKeyAndVisible()
        self.iconView.startAnimating()
        
        UIView.animate(withDuration: 0.5) {
            self.window.alpha = 1.0
        }
    }
    
    private func stopAnim() {
        // set root window to key
        self.rootWindow?.makeKey()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.window.alpha = 0.0
        }) { (_) in
            self.iconView.stopAnimating()
        }
    }
}
