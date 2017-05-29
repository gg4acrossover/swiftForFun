//
//  ONAPIClientHelper.swift
//  Project 03 -OnAPIClient
//
//  Created by viethq on 5/29/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import Foundation
import Alamofire

// unit protocol
public protocol ONPath {
    var path : String { get }
}

// unit protocol
public protocol ONToken {
    var tokenKind : String { get }
    var tokenStr : String { get }
    var isAuthorization : Bool { get }
}

// unit protocol
public protocol ONMethod {
    var method : Alamofire.HTTPMethod { get }
}

// protocol container
public protocol ONUrl : ONPath, ONToken, ONMethod {
    var baseURL : String { get }
    var url : String { get }
}

// default token
extension ONToken {
    var tokenKind : String {
        return "Bearer"
    }
    
    var tokenStr : String {
        return ""
    }
    
    var isAuthorization : Bool {
        return false
    }
}

// default generate url
extension ONUrl {
    var url : String {
        return self.baseURL.appending(self.path)
    }
}
