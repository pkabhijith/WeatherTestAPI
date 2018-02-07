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
        print(123)
        
        //let basepath = "http://api.apixu.com/v1/forecast.json?key=2f076e71ad814f6bb16235617180602&q=Greenbelt&days=5"
        
        //guard let url = URL(string: basepath) else { return}
        
       // URLSession.shared.dataTask(with: url)  { (data:Data?, response:URLResponse?, error:Error?) in
            
         //   guard let sata = data else {return}
            
           // if let dataAsString = String(data:sata, encoding: .utf8) {
            //    print(dataAsString)
           // }
            
       // }
       // .resume()
        
        Weather.forecast { (results:[Weather]) in
            for result in results {
                print("\(result)\n\n")
                print(123)
            }
    }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

