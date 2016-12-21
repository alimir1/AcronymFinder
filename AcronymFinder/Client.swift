//
//  NactemClient.swift
//  AcronymFinder
//
//  Created by Ali Mir on 12/20/16.
//  Copyright © 2016 com.AliMir. All rights reserved.
//

import Foundation
import Alamofire

class NactemClient: NSObject {
    
    // MARK: - Singleton
    static var shared = NactemClient()
    
    // MARK: - Initializers
    override init() {
        super.init()
    }
    
    // MARK: - GET Method
    
    func taskForGet(parameters: [String : String], completionHandler: @escaping (_ result: AnyObject?, _ error: Error?) -> Void) {
        
        let AlamoFireRequest = Alamofire.request(nactemURL, parameters: parameters)
        
        AlamoFireRequest.responseJSON { response in
            
            func sendError(error: String) {
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandler(nil, NSError(domain: "taskForGet", code: 1, userInfo: userInfo))
            }
            
            guard response.result.error == nil else {
                sendError(error: response.result.error!.localizedDescription)
                return
            }
            
            guard response.result.isSuccess == true else {
                sendError(error: "Response not successful.")
                return
            }
            
            if let JSON = response.result.value {
                completionHandler(JSON as AnyObject?, nil)
            } else {
                sendError(error: "Could not get JSON data.")
            }
        }
    }
    
    // MARK: - Helpers
    
    // Create a URL from parameters and path extensions
    private var nactemURL: URL {
        var components = URLComponents()
        components.scheme = NactemClient.Constants.ApiScheme
        components.host = NactemClient.Constants.ApiHost
        components.path = NactemClient.Constants.ApiPath
        return components.url!
    }
}
