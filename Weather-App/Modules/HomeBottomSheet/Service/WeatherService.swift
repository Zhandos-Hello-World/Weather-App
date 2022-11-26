//
//  WeatherService.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 25.11.2022.
//

import Foundation

protocol WeatherServiceProtocol {
    
    func getWeather(lat: String, lon: String, extra: Bool, completion: @escaping (Result<WeatherListResponse, NetworkError>) -> Void)
    
    func getWeather(lat: String, lon: String, completion: @escaping (Result<WeatherListResponse, NetworkError>) -> Void)
}

final class WeatherService: WeatherServiceProtocol {
    private let client: NetworkService
    
    init(client: NetworkService) {
        self.client = client
    }
    
    func getWeather(lat: String, lon: String, extra: Bool, completion: @escaping (Result<WeatherListResponse, NetworkError>) -> Void) {
        client.execute(with: WeatherListRouter.weatherlist(lat: lat, lon: lon, extra: extra), completion: completion)
    }
}

extension WeatherServiceProtocol {
    
    func getWeather(lat: String, lon: String, completion: @escaping (Result<WeatherListResponse, NetworkError>) -> Void) {
        getWeather(lat: lat, lon: lon, extra: true, completion: completion)
    }
}
