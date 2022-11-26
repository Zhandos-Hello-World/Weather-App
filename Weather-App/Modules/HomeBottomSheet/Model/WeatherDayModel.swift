//
//  WeatherDayModel.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 25.11.2022.
//

import Foundation

protocol WeatherDayModelProtocol {
    var timestamp: Int { get }
    var date: String { get }
    var tempDay: String { get }
    var tempNight: String { get }
    var condition: String { get }
}

struct WeatherDayModel: WeatherDayModelProtocol {
    private let forecast: Forecast
    
    init(forecast: Forecast) {
        self.forecast = forecast
    }
    
    var timestamp: Int {
        forecast.date_ts
    }

    var date: String {
        forecast.date
    }
    
    var tempDay: String {
        guard let dayTemp = forecast.parts.day.temp_avg else {
            return "--"
        }
        return "\(dayTemp)"
    }
    
    var tempNight: String {
        guard let nightTemp = forecast.parts.night.temp_avg else {
            return "--"
        }
        return "\(nightTemp)"
    }
    
    var condition: String {
        forecast.parts.day.condition
    }
    
}
