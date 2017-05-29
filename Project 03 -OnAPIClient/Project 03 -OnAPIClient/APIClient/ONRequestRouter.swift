//
//  ONRequestRouter.swift
//  Project 03 -OnAPIClient
//
//  Created by viethq on 5/23/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - router for github
enum ONGithubURL : ONUrl {
    var baseURL: String {
        return BASE_URL
    }

    case getGitHubUser(account : String)
    
    var path: String {
        switch self {
        case .getGitHubUser(let acc):
            return "users/\(acc)"
        }
    }
    
}

// MARK: - method for github urls
extension ONGithubURL : ONMethod {
    var method: HTTPMethod {
        switch self {
        case .getGitHubUser(_):
            return .get
        }
    }
}

// MARK: - generate token for github url
extension ONGithubURL : ONToken {
    var isAuthorization: Bool {
        switch self {
        case .getGitHubUser(_):
            return false
        }
    }
    
    var tokenStr : String {
        switch self {
        case .getGitHubUser(_):
            return ""
        }
    }
}
