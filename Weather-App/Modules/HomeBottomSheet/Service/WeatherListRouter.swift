//
//  WeatherListRouter.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 25.11.2022.
//

import Foundation


enum WeatherListRouter: Router {
    case weatherlist(lat: String, lon: String, extra: Bool)
    
    var baseUrl: String {
        "https://api.weather.yandex.ru"
    }
    
    var headers: Headers {
        return YANDEX_API
    }
    
    var path: String {
        return "/v2/forecast"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters {
        switch self {
        case .weatherlist(let lat, let lon, let extra):
            return ["lat": lat, "lon": lon, "extra": extra]
        }
    }
}
private let YANDEX_API = ["x-Yandex-API-Key": "648ffe20-aa3d-4126-9744-9c0a333103f6"]
