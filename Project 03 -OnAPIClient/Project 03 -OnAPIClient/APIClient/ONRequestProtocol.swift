//
//  ONRequestProtocol.swift
//  Project 03 -OnAPIClient
//
//  Created by viethq on 5/24/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit
import Alamofire

public protocol ONRequestProtocol : URLRequestConvertible {
    static var baseUrl : String { get }
    
    var path : String { get }
    
    var method : HTTPMethod { get }
    
    var isAuthorization : Bool { get }
    
    var token : String { get }
    
    var tokenKind : String { get }
}

// default
extension ONRequestProtocol {
    static var baseUrl : String {
        return BASE_URL
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Self.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        
        urlRequest.httpMethod = self.method.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("charset=utf-8", forHTTPHeaderField: "Accept")
        urlRequest.addValue("text/html", forHTTPHeaderField: "Accept")
        
        if isAuthorization {
            urlRequest.setValue(self.tokenKind + " " + self.token, forHTTPHeaderField: "Authorization")
        }
        
        debugPrint(urlRequest.allHTTPHeaderFields!)
        
        return urlRequest
    }
    
    var isAuthorization : Bool {
        return false
    }
    
    var token : String {
        return ""
    }
    
    var tokenKind : String {
        return "Bearer"
    }
}
