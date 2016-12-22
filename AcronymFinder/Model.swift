//
//  Model.swift
//  NactemAPIModel.swift
//
//  Created by Ali Mir on 12/20/16.
//  Copyright © 2016 com.AliMir. All rights reserved.
//

import Foundation

struct LongformObject {
    let representativeFormOfFullForm: String
    let numberOfOccurrencesInCorpus: Int
    let yearOfFirstTimeInCorpus: Int
    let variationObjects: [VariationObject]
    
    init(representativeFormOfFullForm: String, numberOfOccurrencesInCorpus: Int, yearOfFirstTimeInCorpus: Int, variationObjects: [VariationObject]) {
        self.representativeFormOfFullForm = representativeFormOfFullForm
        self.numberOfOccurrencesInCorpus = numberOfOccurrencesInCorpus
        self.yearOfFirstTimeInCorpus = yearOfFirstTimeInCorpus
        self.variationObjects = variationObjects
    }
    
    init(dictionary: [String : AnyObject]) {
        let representativeOfFullForm = dictionary[NactemClient.JSONKeys.fullForm] as! String
        let numberOfOccurrencesInCorpus = Int(dictionary[NactemClient.JSONKeys.frequency] as! NSNumber)
        let year = Int(dictionary[NactemClient.JSONKeys.startYear] as! NSNumber)
        let variationObjects = (dictionary[NactemClient.JSONKeys.varObjects] as! [[String : AnyObject]]).map {VariationObject(dictionary: $0)}
        self.init(representativeFormOfFullForm: representativeOfFullForm, numberOfOccurrencesInCorpus: numberOfOccurrencesInCorpus, yearOfFirstTimeInCorpus: year, variationObjects: variationObjects)
    }
}

struct VariationObject {
    let surfaceFormOfFullForm: String
    let numberOfOccurrencesInCorpus: Int
    let yearOfFirstTimeInCorpus: Int
    
    init(surfaceFormOfFullForm: String, numberOfOccurrencesInCorpus: Int, yearOfFirstTimeInCorpus: Int) {
        self.surfaceFormOfFullForm = surfaceFormOfFullForm
        self.numberOfOccurrencesInCorpus = numberOfOccurrencesInCorpus
        self.yearOfFirstTimeInCorpus = yearOfFirstTimeInCorpus
    }
    
    init(dictionary: [String : AnyObject]) {
        let surfaceForm = dictionary[NactemClient.JSONKeys.fullForm] as! String
        let numOfOccurrences = Int(dictionary[NactemClient.JSONKeys.frequency] as! NSNumber)
        let year = Int(dictionary[NactemClient.JSONKeys.startYear] as! NSNumber)
        self.init(surfaceFormOfFullForm: surfaceForm, numberOfOccurrencesInCorpus: numOfOccurrences, yearOfFirstTimeInCorpus: year)
    }
}
