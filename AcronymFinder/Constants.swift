//
//  Constants.swift
//  AcronymFinder
//
//  Created by Ali Mir on 12/20/16.
//  Copyright © 2016 com.AliMir. All rights reserved.
//

import Foundation

extension NactemClient {
    // MARK: - Constants
    struct Constants {
        // MARK: - URLs
        static let ApiScheme = "http"
        static let ApiHost = "www.nactem.ac.uk"
        static let ApiPath = "/software/acromine/dictionary.py"
    }
    
    // MARK: - JSONKeys
    struct JSONKeys {
        static let fullForm = "lf"
        static let abbreviation = "sf"
        static let frequency = "freq"
        static let startYear = "since"
        static let varObjects = "vars"
    }
}
