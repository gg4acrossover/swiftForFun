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

// generate url
extension ONUrl {
    var url : String {
        return self.baseURL.appending(self.path)
    }
}

public class ONRequestHelper : URLRequestConvertible {
    
    public typealias httpMethod = Alamofire.HTTPMethod
    
    private var router : ONUrl
    private var params : String?
    
    public init(router : ONUrl,
                params : String? = nil) {
        self.router = router
        self.params = params
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try self.router.url.asURL()
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = self.router.method.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("charset=utf-8", forHTTPHeaderField: "Accept")
        urlRequest.addValue("text/html", forHTTPHeaderField: "Accept")
        
        if self.router.isAuthorization {
            urlRequest.setValue(self.router.tokenKind + " " + self.router.tokenStr, forHTTPHeaderField: "Authorization")
        }
        
        debugPrint(urlRequest.allHTTPHeaderFields!)
        
        return urlRequest
    }
}
