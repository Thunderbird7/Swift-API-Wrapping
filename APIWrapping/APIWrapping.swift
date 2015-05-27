//
//  APIWrapping.swift
//  APIWrapping
//
//  Created by Yuttana Kungwon on 5/26/2558 BE.
//  Blog: http://yuttana.me
//  Copyright (c) 2558 E-Commerce Solution Co., Ltd. All rights reserved.
//

import Alamofire

private let _sharedInstance = APIWrapping()

class APIWrapping {
    
    // Create Singleton
    // In Swift we can created singleton pattern by use static to stored object
    static let sharedManager = _sharedInstance
    
    // Prepare Base API URL
    let kStringBaseURL: String! = "http://httpbin.org/"
    
    func get(path: String, params: [String: AnyObject]? = nil,
        success: (responseObject: AnyObject?) -> Void,
        failure: (error: NSError?) -> Void) {
            
            let url = "\(self.kStringBaseURL)\(path)"
            
            Alamofire.request(.GET, url, parameters: params)
                .responseJSON { (_, _, responseObject, responseError) -> Void in
                    if(responseError != nil) {
                        return failure(error: responseError)
                    } else {
                        return success(responseObject: responseObject)
                    }
            }
    }
    
    func put(path: String, params: [String: AnyObject]? = nil,
        success: (responseObject: AnyObject?) -> Void,
        failure: (error: NSError?) -> Void) {
            
            let url = "\(self.kStringBaseURL)\(path)"
            
            Alamofire.request(.PUT, url, parameters: params)
                .responseJSON { (_, _, responseObject, responseError) -> Void in
                    if(responseError != nil) {
                        return failure(error: responseError)
                    } else {
                        return success(responseObject: responseObject)
                    }
            }
    }
    
    func post(path: String, params: [String: AnyObject]? = nil,
        success: (responseObject: AnyObject?) -> Void,
        failure: (error: NSError?) -> Void) {
            
            let url = "\(self.kStringBaseURL)\(path)"
            
            Alamofire.request(.POST, url, parameters: params)
                .responseJSON { (_, _, responseObject, responseError) -> Void in
                    if(responseError != nil) {
                        return failure(error: responseError)
                    } else {
                        return success(responseObject: responseObject)
                    }
            }
    }
    
    func delete(path: String, params: [String: AnyObject]? = nil,
        success: (responseObject: AnyObject?) -> Void,
        failure: (error: NSError?) -> Void) {
            
            let url = "\(self.kStringBaseURL)\(path)"
            
            Alamofire.request(.DELETE, url, parameters: params)
                .responseJSON { (_, _, responseObject, responseError) -> Void in
                    if(responseError != nil) {
                        return failure(error: responseError)
                    } else {
                        return success(responseObject: responseObject)
                    }
            }
    }
    
}
