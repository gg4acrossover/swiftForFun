//
//  ONAPIClient.swift
//  Project 03 -OnAPIClient
//
//  Created by viethq on 5/29/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


/// wrapper of alamofire
open class ONAPIClient {
    //MARK: - Properties
    private let sessionMng = SessionManager.default
    public static let `default` = ONAPIClient()
    
    
    // MARK: - Method
    /// call api using instance implement ONURL interface
    /// this call using default validate
    /// - Returns: DataRequest (Alamofire)
    @discardableResult
    public func call(router: ONUrl, params: [String: Any]? = nil, success: @escaping responseJSON, fail: @escaping responseError) -> DataRequest {
        
        // add accept header
        var headers = ["Accept" : "application/json,charset=utf-8,text/html"]
        
        // add authorization if need
        if router.isAuthorization {
            headers["Authorization"] = router.tokenStr
        }
        
        debugPrint(router.method.rawValue + " " + router.url)
        
        return sessionMng.request(router.url, method: router.method, parameters: params, headers: headers)
                         .validate()
                         .responseJSON { response in
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
