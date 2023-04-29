//
//  Day.swift
//  Clothes Recorder
//
//  Created by Hansol Yang on 2023/04/28.
//

import Foundation
import SwiftUI

// Codable -> makes it easier to move data between the structure and a data file
struct Day: Hashable, Codable {
    var date: Date
    var temperature: Double
    var isRainy: Bool
    let clothes: [Outfit]
    let lat: Double
    let long: Double
    var location: String
    
    struct Outfit: Hashable, Codable {
        var outfit: String
        
        private var imageName: String
        var image: Image {
            Image(imageName)
        }
    }
    
    func getWeather(location: String, day: Day) -> Day{

        let headers = [
            "content-type": "application/octet-stream",
            "X-RapidAPI-Key": "SIGN-UP-FOR-KEY",
            "X-RapidAPI-Host": "forecast9.p.rapidapi.com"
        ]
        
        let url: String = String(format: "https://forecast9.p.rapidapi.com/rapidapi/forecast/%s/hourly/", location);

        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })

        dataTask.resume()
        
        return day;
    }
}

/*
{
  "location": {
    "code": "DE0004130",
    "timezone": "Europe/Berlin",
    "name": "Hamburg",
    "coordinates": {
      "latitude": 0,
      "longitude": 0
    }
  },
  "forecast": {
    "items": [
      {
        "date": "2019-02-25T03:00:00Z",
        "period": 1,
        "freshSnow": 1.1,
        "weather": {
          "state": 0,
          "text": "",
          "icon": ""
        },
        "sunHours": 1.2,
        "rainHours": 1.2,
        "prec": {
          "sum": 0,
          "sumAsRain": 0,
          "probability": 0,
          "class": 0
        },
        "temperature": {
          "avg": 0,
          "min": 0,
          "max": 0
        },
        "pressure": 1001.7,
        "relativeHumidity": 92,
        "clouds": {
          "high": 0,
          "low": 0,
          "middle": 0
        },
        "wind": {
          "unit": "km/h",
          "direction": "SW",
          "avg": 5,
          "min": 1,
          "max": 8,
          "text": "Südwestwind",
          "significationWind": true,
          "gusts": {
            "value": 100,
            "text": "Sturm mit Orkanböen"
          }
        },
        "windchill": {
          "avg": 0,
          "min": 0,
          "max": 0
        },
        "snowLine": {
          "avg": 0,
          "min": 0,
          "max": 0,
          "unit": ""
        },
        "isNight": true
      }
    ],
    "forecastDate": "2019-02-07T10:00:00",
    "nextUpdate": "2019-02-07T10:00:00",
    "source": "w3Data",
    "point": "global"
  }
}
*/
