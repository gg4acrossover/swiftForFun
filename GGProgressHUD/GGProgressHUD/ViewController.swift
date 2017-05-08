//
//  ViewController.swift
//  GGProgressHUD
//
//  Created by viethq on 5/5/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.settingUI()
        self.testProgress()
    }
    
    func testProgress() {
        // first time
        let testTime = 5.0
        DispatchQueue.main.asyncAfter(deadline: .now() + testTime) {
            GGProgressHUD.show()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + testTime + 3.0) {
            GGProgressHUD.hide()
        }
        
        // the second time
        DispatchQueue.main.asyncAfter(deadline: .now() + testTime + 4.0) {
            GGProgressHUD.show()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + testTime + 7.0) {
            GGProgressHUD.hide()
        }
    }
    
    func settingUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapMe))
        self.view.addGestureRecognizer(tap)
        
        self.textField.delegate = self
    }
    
    func tapMe(sender : UITapGestureRecognizer) {
        print("tap me")
        self.view.endEditing(true)
    }
}

//MARK: - Textfield
extension ViewController : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}

