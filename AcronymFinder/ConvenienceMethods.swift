//
//  ConvenienceMethods.swift
//  AcronymFinder
//
//  Created by Ali Mir on 12/20/16.
//  Copyright © 2016 com.AliMir. All rights reserved.
//

import Foundation

extension NactemClient {
    //MARK: - GET Responses
    func getNactemObjects(from abbreviation: String, completionHandler: @escaping (_ data: [LongformObject]?, _ error: Error?) -> Void) {
        self.taskForGet(parameters: [JSONKeys.abbreviation : abbreviation]) {
            (data, error) in
            func sendError(error: String) {
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandler(nil, NSError(domain: "getLongForms", code: 0, userInfo: userInfo))
            }
            guard error == nil else { completionHandler(nil, error); return}
            guard let JSON = data as? [[String : AnyObject]] else {sendError(error: "Error in JSON object."); return }
            guard JSON.count > 0 else {sendError(error: "No information was found for that acronym."); return }
            let json = JSON[0]
            if let longForms = json[JSONKeys.longFormObjects] as? [[String : AnyObject]] {
                let longFormObjects = longForms.map {LongformObject(dictionary: $0)}
                completionHandler(longFormObjects, nil)
            } else {
                sendError(error: "Something went wrong.")
            }
        }
    }
}
