//
//  ViewController.swift
//  AcronymFinder
//
//  Created by Ali Mir on 12/20/16.
//  Copyright © 2016 com.AliMir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NactemClient.shared.getNactemObjects(from: "HMM") {
            (data, error) in
            if let data = data {
                print("Abbreviation: \(data.abbreviation), First of lfs: \(data.longFormObjects[0])")
            }
        }
    }
}
