//
//  Weather.swift
//  Weathertest
//
//  Created by Abhijith Prasanna Kumar on 2/5/18.
//  Copyright © 2018 Abhijith Prasanna Kumar. All rights reserved.
//

import Foundation

struct Weather  {
    
    let summary : String
    let icon: String
    let maxTempOfDay: Double
    
    init?(json:[String:Any]) {
        
       //guard let astro = json["astro"] as? [String:Any],
            //let date = json["date"] as? String,
            //let date_epoch = json["date_epoch"] as? Int,
      guard let day = json["day"] as? [String:Any],
            let condition = day["condition"] as? [String:Any],
            let summary = condition["text"],
            let icon = condition["icon"],
            let maxTempOfDay = day["maxtemp_f"]
        else {
            return nil
        }
        self.summary=summary as! String
        self.icon = icon as! String
        self.maxTempOfDay=maxTempOfDay as! Double
    }
    
    struct Location {
        
        let city:String
        let region: String
        let localTime: String
    
        init?(json:[String:Any]) {
            
            guard let location = json["location"] as? [String:Any],
                  let city = location["name"],
                  let region = location["region"],
                  let localTime=location["localtime"]
                else {
                    return nil
            }
            self.city=city as! String
            self.region=region as! String
            self.localTime = localTime as! String
        }
    }
    
    struct CurrentWeather {
        
        let temperatureCelsius: Double
        let temperatureFarenheit: Double
        let summary: String
        let icon: String
        let feelslikeCelsius:Double
        let feelslikeFarenheit:Double
        
    }
    
    
    static let basepath = "http://api.apixu.com/v1/forecast.json?key=2f076e71ad814f6bb16235617180602&q=Greenbelt&days=5"
    static func forecast (completion: @escaping ([Weather]) -> ()) {
    guard let request = URL(string: basepath) else { return}

        
    let task = URLSession.shared.dataTask(with: request) { (data,response,error) -> Void in
        var forecastArray : [Weather] = []
        if let data = data {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] {
                    //print(json)
                    if let dailyForecast = json["forecast"] as?  [String:Any] {
                        //print (dailyForecast)
                        if let forecastday = dailyForecast["forecastday"] as? [[String:Any]] {
                            for case let everyday in forecastday  {
                            //print (everyday)
                                if let eachResult = Weather(json:everyday) {
                                    forecastArray.append(eachResult)
                                }
                        }
                    }
                    
                    }}

            } catch let error as Error {
                print(error.localizedDescription)
            }
        } else if let error = error {
            print(error.localizedDescription)
        }
        completion(forecastArray)
        //print (forecastArray)
        }
       
task.resume()
}
}
































