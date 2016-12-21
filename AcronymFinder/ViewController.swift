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
        NactemClient.shared.getNactemObjects(from: "23lksdlk") {
            (data, error) in
            if let error = error {
                // FIXME: - Present error model (localized error) whenever an error occurs.
                print(error.localizedDescription)
            }
            if let acronymObject = data {
                print("\(acronymObject.abbreviation)\n\n\(acronymObject.longFormObjects)")
            }
        }
    }
}
