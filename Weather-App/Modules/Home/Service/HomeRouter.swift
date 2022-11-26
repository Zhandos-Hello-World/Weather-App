//
//  HomeRouter.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 18.11.2022.
//

import Foundation
import OrderedCollections

enum HomeRouter: Router {
    
    case weather(lat: String, lon: String, apiKey: String, units: String, lang: String)
    
    var baseUrl: String {
        "https://api.openweathermap.org"
    }
    
    var path: String {
        return "/data/2.5/weather"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters {
        switch self {
        case .weather(let lat, let lon, let apiKey, let units, let lang):
            return ["lat": lat, "lon": lon, "units": units, "lang": lang,"appid": apiKey]
        }
    }
}
