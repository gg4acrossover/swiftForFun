//
//  ONAPIClient+Request.swift
//  Project 03 -OnAPIClient
//
//  Created by viethq on 5/29/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import Foundation

extension ONAPIClient {
    static func getGithubAcc(_ userName : String, success: @escaping responseJSON, fail: @escaping responseError) {
        ONAPIClient.default.call(router: ONGithubURL.getGitHubUser(account: "gg4acrossover"), success: success, fail: fail)
    }
}
