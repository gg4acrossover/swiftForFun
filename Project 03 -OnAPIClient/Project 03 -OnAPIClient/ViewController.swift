//
//  ViewController.swift
//  Project 03 -OnAPIClient
//
//  Created by viethq on 5/20/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.callGithubUser(acc: "gg4acrossover")
    }
    
    func callGithubUser(acc: String) {
        ONAPIClient.getGithubAcc(acc, success: { (json) in
            debugPrint(json)
        }) { (err) in
            debugPrint(err!)
        }
    }
}

