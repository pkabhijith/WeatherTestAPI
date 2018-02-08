//
//  ViewController.swift
//  Weathertest
//
//  Created by Abhijith Prasanna Kumar on 2/5/18.
//  Copyright © 2018 Abhijith Prasanna Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Weather.forecast { (results:[Weather]) in
            for result in results {
                print("\(result)\n\n")
            }
    }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

