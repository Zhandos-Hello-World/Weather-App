//
//  HomeService.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 18.11.2022.
//

import Foundation


protocol HomeServiceProtocol {
    
    func getWeather(lat: String, lon: String, apiKey: String, units: String, lang: String, completion: @escaping (Result<HomeResponse, NetworkError>) -> Void)
    
    func getWeather(lat: String, lon: String, apiKey: String, units: String, completion: @escaping (Result<HomeResponse, NetworkError>) -> Void)
    
    func getWeather(lat: String, lon: String, apiKey: String, completion: @escaping (Result<HomeResponse, NetworkError>) -> Void)
    
}

final class HomeService: HomeServiceProtocol {
    
    private let client: NetworkService
    
    init(client: NetworkService) {
        self.client = client
    }
    

    func getWeather(lat: String, lon: String, apiKey: String, units: String, lang: String, completion: @escaping (Result<HomeResponse, NetworkError>) -> Void) {
        client.execute(with: HomeRouter.weather(lat: lat, lon: lon, apiKey: apiKey, units: units, lang: lang), completion: completion)
    }
}

extension HomeServiceProtocol {
    
    func getWeather(lat: String, lon: String, apiKey: String, units: String, completion: @escaping (Result<HomeResponse, NetworkError>) -> Void) {
        getWeather(lat: lat, lon: lon, apiKey: apiKey, units: units, lang: "en", completion: completion)
    }
    
    func getWeather(lat: String, lon: String, apiKey: String, completion: @escaping (Result<HomeResponse, NetworkError>) -> Void) {
        getWeather(lat: lat, lon: lon, apiKey: apiKey, units: "metric", lang: "en", completion: completion)
    }
}
