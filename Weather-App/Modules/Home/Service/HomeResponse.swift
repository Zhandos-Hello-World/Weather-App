//
//  HomeResponse.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 18.11.2022.
//

import Foundation


struct HomeResponse: Decodable {
    let weather: [WeatherResponse]
    let main: MainResponse
    let visibility: Int
    let wind: WindResponse
}

struct WeatherResponse: Decodable {
    let main: String
    let description: String
}

struct MainResponse: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int
    let grnd_level: Int
}

struct WindResponse: Decodable {
    let speed: Double
    let deg: Int
    let gust: Double
}
