//
//  Day.swift
//  Clothes Recorder
//
//  Created by Hansol Yang on 2023/04/28.
//

import Foundation
import SwiftUI
import CoreLocation
import RealmSwift

var WEATHER_API_ACCESS_KEY: String = "e49fc9395406c5976fb0aac626dfebea"

// Codable -> makes it easier to move data between the structure and a data file
struct Record: Hashable, Codable {
    var date: Date
    var outfits: [Outfit]
    
    var location: Location

    var weather: Weather

    init(d: Date = Date(), is_location_shared: Bool, loc: String) {
        date = d;
        outfits = [];
        location = Location(city: loc);
        location.getLocation(search_location: is_location_shared);
        weather = Weather(location: location);
    }
    
    mutating func addOutfit(outfit: Outfit) {
        outfits.append(outfit);
    }
    
    struct Location: Hashable, Codable {
        var lat: Double
        var lon: Double
        var address: String
        let city: String
        
        init(city: String) {
            self.city = city;
        }
        
        func getLocation(search_location: Bool) {
            // TODO: set lat, lon, address, city if search_location is True
        }
    }
        
    struct Outfit: Hashable, Codable {
        var outfit: String
        var satisfaction: Int // 0: Too cold 1: Appropriate 2: Too hot
        
        private var imageURI: String
        var image: Image {
            Image(imageURI)
        }
        
        init(otf: String, s: Int, iURI: String) {
            outfit = otf;
            satisfaction = s;
            imageURI = iURI;
        }
    }
    
    struct Weather: Hashable, Codable {
        var temperature: Double
        var description: String
        var windSpeed: Int
        var humidity: Int
        
        private var iconURI: String
        var icon: Image {
            Image(iconURI)
        }
        
        init(location: Location) {
            
            var urlString = String(format: "http://api.weatherstack.com/current?access_key=%s&query=%s", WEATHER_API_ACCESS_KEY, location.city)
            var url: URL = URL(string: urlString)!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            // TODO: get API response and set weather info
            
            temperature = res.temperature;
            description = res.description;
            windSpeed = res.windSpeed;
            humidity = res.humidity;
            iconURI = res.iconURI;
        }
    }
    
//    func getWeather(location: Location) -> Weather{
//
//        var urlString = String(format: "http://api.weatherstack.com/current?access_key=%s&query=%s", WEATHER_API_ACCESS_KEY, location.city)
//        var url: URL = URL(string: urlString)!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
////        var url: NSURLComponents = NSURLComponents(string: "http://api.weatherstack.com/current/")!
////
//////        url.queryItems = [
//////            NSURLQueryItem(name: "access_key", value: WEATHER_API_ACCESS_KEY),
//////            NSURLQueryItem(name: "query", value: location)
//////        ]
////
////        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
////                                                cachePolicy: .useProtocolCachePolicy,
////                                            timeoutInterval: 10.0)
////        request.httpMethod = "GET"
//
//        var t: Double = 0
//        var d: String = ""
//        var w: Int = 0
//        var h: Int = 0
//        var i: String = ""
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error as Any)
//            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
//            }
//        })
//
//        dataTask.resume()
//
//        let weather = Weather(temp: t, des: d, wSP: w, h: h, iURI: i);
//        return weather;
//    }
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
