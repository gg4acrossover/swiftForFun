//
//  ONAPIClient+Request.swift
//  Project 03 -OnAPIClient
//
//  Created by viethq on 5/29/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import Foundation

extension ONAPIClient {
    
    /// call github's user detail
    static func getGithubAcc(_ userName : String, success: @escaping responseJSON, fail: @escaping responseError) {
        let router = ONGithubURL.getGitHubUser(account: "gg4acrossover")
        ONAPIClient.default.call(router: router, success: success, fail: fail)
    }
}
