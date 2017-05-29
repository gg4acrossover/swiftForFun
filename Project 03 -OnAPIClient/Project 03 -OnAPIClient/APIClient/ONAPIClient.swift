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
    /// - Returns: DataRequest (Alamofire)
    @discardableResult
    public func call(router: ONUrl, params: [String: Any]? = nil, success: @escaping responseJSON, fail: @escaping responseError) -> DataRequest {
        
        var headers = ["Accept" : "application/json,charset=utf-8,text/html"]
        
        if router.isAuthorization {
            headers["Authorization"] = router.tokenStr
        }
        
        debugPrint(router.method.rawValue + " " + router.url)
        
        return sessionMng.request(router.url, method: router.method, parameters: params, headers: headers)
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
        
    /// call api using instance of ONRequestHelper
    /// - Returns: DataRequest (Alamofire)
    @discardableResult
    public func call(requestHelper : ONRequestHelper, success: @escaping responseJSON, fail: @escaping responseError) -> DataRequest {
        return  Alamofire.request(requestHelper).validate()
                         .responseJSON { (response) in
                    switch response.result {
                        case .success(let value):
                            let json = JSON(value)
                            success(json)
                        case .failure(let error):
                            if error._code == NSURLErrorTimedOut {
                                debugPrint("Request Timeout...")
                            }
                            fail(error)
                    } // end switch
                } // end return scope
    }
}
