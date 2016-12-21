//
//  Model.swift
//  NactemAPIModel.swift
//
//  Created by Ali Mir on 12/20/16.
//  Copyright © 2016 com.AliMir. All rights reserved.
//

import Foundation

extension NactemClient {
    struct LongformObject {
        let representativeFormOfFullForm: String
        let numberOfOccurrencesInCorpus: Int
        let yearOfFirstTimeInCorpus: Int
        let variationObjects: [VariationObject]
        
        init(representativeFormOfFullForm: String, numberOfOccurrencesInCorpus: Int, yearOfFirstTimeInCorpus: Int, variationObjects: [VariationObject]) {
            self.representativeFormOfFullForm = representativeFormOfFullForm
            self.numberOfOccurrencesInCorpus  = numberOfOccurrencesInCorpus
            self.yearOfFirstTimeInCorpus = yearOfFirstTimeInCorpus
            self.variationObjects = variationObjects
        }
    }
    
    struct VariationObject {
        let surfaceFormOfFullForm: String
        let numberOfOccurrencesInCorpus: Int
        let yearOfFirstTimeInCorpus: Int
    }
}
