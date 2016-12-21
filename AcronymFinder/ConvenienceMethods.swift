//
//  NactemConvenience.swift
//  AcronymFinder
//
//  Created by Ali Mir on 12/20/16.
//  Copyright © 2016 com.AliMir. All rights reserved.
//

import Foundation

extension NactemClient {
    
    //MARK: - GET Abbreviations
    
    func getAbbreviations(from fullForm: String, completionHandler: @escaping (_ data: [NactemClient.VariationObject], _ error: Error?) -> Void) {
        
    }
    
    //MARK: - GET Full Forms
    
    func getLongForms(from abbreviation: String, completionHandler: @escaping (_ data: [NactemClient.LongformObject]?, _ error: Error?) -> Void) {
        self.taskForGet(parameters: [JSONKeys.abbreviation : abbreviation]) {
            (data, error) in
            func sendError(error: String) {
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandler(nil, NSError(domain: "getLongForms", code: 1, userInfo: userInfo))
            }
            guard error == nil else { completionHandler(nil, error); return}
            guard let JSON = data else { sendError(error: "Could not get JSON object in getLongForms."); return }
            
            print("HORRAYY::: EXAMPLE: \(JSON)")
            
        }
    }
}
