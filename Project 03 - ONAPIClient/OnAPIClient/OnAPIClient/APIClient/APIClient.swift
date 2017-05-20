//
//  APIClient.swift
//  TeaManga
//
//  Created by Nguyễn Khánh Ngọc on 3/1/17.
//  Copyright © 2017 _Th3M4sk_. All rights reserved.
//

import Alamofire
import SwiftyJSON

class APIClient {
    
    static func GET(url: String, params: [String: Any]?, success: @escaping responseJSON, fail: @escaping responseError) {
        
        let fullURL = BASE_URL + url
        debugPrint("- GET: \(fullURL)")
        if let params = params {
            debugPrint("- Params: \(String(describing: params))")
        }
        
        Alamofire.request(fullURL, method: .get, parameters: params).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                success(json)
            case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    debugPrint("Request Timeout...")
                }
                fail(error)
            }
        }
    }
    
    static func POST(url: String, params: [String: Any]?, success: @escaping responseJSON, fail: @escaping responseError) {
        
        let fullURL = BASE_URL + url
        debugPrint("- POST: \(fullURL)")
        debugPrint("- Params: \(String(describing: params))")
        
        Alamofire.request(fullURL, method: .post, parameters: params).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                success(json)
            case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    debugPrint("Request Timeout...")
                }
                fail(error)
            }
        }
    }
    
    static func PUT(url: String, params: [String: Any]?, success: @escaping responseJSON, fail: @escaping responseError) {
        
        let fullURL = BASE_URL + url
        debugPrint("- PUT: \(fullURL)")
        debugPrint("- Params: \(String(describing: params))")
        
        Alamofire.request(fullURL, method: .put, parameters: params).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                success(json)
            case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    debugPrint("Request Timeout...")
                }
                fail(error)
            }
        }
    }
    
    static func DELETE(url: String, params: [String: Any]?, success: @escaping responseJSON, fail: @escaping responseError) {
        
        let fullURL = BASE_URL + url
        debugPrint("- DELETE: \(fullURL)")
        debugPrint("- Params: \(String(describing: params))")
        
        Alamofire.request(fullURL, method: .delete, parameters: params).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                success(json)
            case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    debugPrint("Request Timeout...")
                }
                fail(error)
            }
        }
    }
}

