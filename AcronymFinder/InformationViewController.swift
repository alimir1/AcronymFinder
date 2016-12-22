//
//  InformationViewController.swift
//  AcronymFinder
//
//  Created by Ali Mir on 12/21/16.
//  Copyright © 2016 com.AliMir. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBOutlet weak var representativeFormOfFullForm: UILabel!
    @IBOutlet weak var numOccurrences: UILabel!
    @IBOutlet weak var yearFirstAppeared: UILabel!
    
    var fullForm: String?
    var numOcc: String?
    var yearAppeared: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        representativeFormOfFullForm.text = fullForm
        numOccurrences.text = numOcc
        yearFirstAppeared.text = yearAppeared
    }
}
