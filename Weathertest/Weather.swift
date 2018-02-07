//
//  Weather.swift
//  Weathertest
//
//  Created by Abhijith Prasanna Kumar on 2/5/18.
//  Copyright © 2018 Abhijith Prasanna Kumar. All rights reserved.
//

import Foundation

struct Weather : {
    
    let summary : String
    let icon: String
    let temp_f: Double
    
    enum SerialError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json:[String:Any]) throws {
        guard let summary = json["text"] as? String else { throw SerialError.missing("Summary text is missing")}
        
        guard let icon = json["icon"] as? String else { throw SerialError.missing("Icon is missing")}
        
        guard let temp_f = json["temp_f"] as? Double else { throw SerialError.missing("Temperature is missing")}
        
        self.summary=summary
        self.icon = icon
        self.temp_f=temp_f
        
    }
    
    static let basepath = "http://api.apixu.com/v1/forecast.json?key=2f076e71ad814f6bb16235617180602&q=Greenbelt&days=5"
    
    static func forecast (completion: @escaping ([Weather]) -> ()) {
        
        guard let request = URL(string: basepath) else { return}
        
        //URLSession.shared.dataTask(with: request)  { (data:Data?, response:URLResponse?, error:Error?) in
            
            //guard let sata = data else {return}
            
            //if let dataAsString = String(data:sata, encoding: .utf8) {
              //  print(dataAsString)
        

        
        URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
           // var forcastArray:[Weather] = []
            
            //guard let sata = data else {return}
            //let dataAsString = String(describing: sata).utf8
            //print(dataAsString)
            
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] {
                        //print(json)
                        if let dailyForecast = json["forecast"] as?  [String:Any] {
                            print (dailyForecast)
                            if let forecastDay = dailyForecast["forecastday"] as? [[String:Any]] {
                                //print (forecastDay)
                                //if let day = forecastDay[["condition"]] as? [<String>] {
                                    //print (day)
                                    //for dataPoint in day {
                                    //if let weatherObject = try? Weather(json:dataPoint) {
                                      //  forcastArray.append(weatherObject)
                                                
                                        
                                      //  }
                                        
                                        
                                  //  }
                                //}
                            }
                        }
                        
                    }
                }
                catch let error as URLError {
                    
                    print(error.localizedDescription)
                }
                catch {
                    print(error)
                }
                
                //completion(forcastArray)
        }
      
    }
        .resume()

}
}

































