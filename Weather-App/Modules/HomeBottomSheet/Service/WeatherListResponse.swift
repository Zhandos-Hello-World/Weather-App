//
//  WeatherListResponse.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 25.11.2022.
//

import Foundation

// MARK: - WeatherListResponse
struct WeatherListResponse: Codable {
    let now: Int
    let now_dt: String
    //let info: Info
    let forecasts: [Forecast]
}

// MARK: - Fact
struct Fact: Codable {
    let obsTime, uptime, temp, feelsLike: Int
    let icon: String
    let condition: String
    let cloudness, precType, precProb, precStrength: Int
    let isThunder: Bool
    let windSpeed: Double
    let windDir: String
    let pressureMm, pressurePa, humidity: Int
    let daytime: String
    let polar: Bool
    let season, source: String
    let accumPrec: [String: Double]
    let soilMoisture: Double
    let soilTemp, uvIndex: Int
    let windGust: Double

    enum CodingKeys: String, CodingKey {
        case obsTime = "obs_time"
        case uptime, temp
        case feelsLike = "feels_like"
        case icon, condition, cloudness
        case precType = "prec_type"
        case precProb = "prec_prob"
        case precStrength = "prec_strength"
        case isThunder = "is_thunder"
        case windSpeed = "wind_speed"
        case windDir = "wind_dir"
        case pressureMm = "pressure_mm"
        case pressurePa = "pressure_pa"
        case humidity, daytime, polar, season, source
        case accumPrec = "accum_prec"
        case soilMoisture = "soil_moisture"
        case soilTemp = "soil_temp"
        case uvIndex = "uv_index"
        case windGust = "wind_gust"
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let date: String
    let date_ts, week: Int
//    let sunrise, sunset, rise_begin, set_end: String
//    let moon_code: Int
//    let moon_text: String
    let parts: Parts
//    let hours: [Hour]
//    let biomet: Biomet?
}

// MARK: - Biomet
struct Biomet: Codable {
    let index: Int
    let condition: String
}

// MARK: - Hour
struct Hour: Codable {
    let hour: String
    let hour_ts, temp, feels_like: Int
    let icon: String
    let condition: String
    let cloudness, prec_type: Int
    let prec_strength: Double
    let is_thunder: Bool
    let wind_dir: String
    let wind_speed, wind_gust: Double
    let pressure_mm, pressure_pa, humidity, uv_index: Int
    let soil_temp: Int
    let soil_moisture, prec_mm: Double
    let prec_period, prec_prob: Int
}

// MARK: - Parts
struct Parts: Codable {
    let day_short, night_short, evening, morning: Day
    let night, day: Day
}

// MARK: - Day
struct Day: Codable {
    let _source: String
    let temp_min, temp_avg, temp_max: Int?
    let wind_speed, wind_gust: Double
    let wind_dir: String
    let pressure_mm, pressure_pa, humidity, soil_temp: Int
    let soil_moisture, prec_mm: Double
    let prec_prob, prec_period: Int
    let cloudness: Double
    let prec_type: Int
    let prec_strength: Double
    let icon: String
    let condition: String
    let uv_index: Int?
    let feels_like: Int
    let daytime: String
    let temp: Int?
}

// MARK: - GeoObject
struct GeoObject: Codable {
    let district, locality, province, country: Country
}

// MARK: - Country
struct Country: Codable {
    let id: Int
    let name: String
}

// MARK: - Info
struct Info: Codable {
    let n: Bool
    let geoid: Int
    let url: String
    let lat, lon: Double
    let tzinfo: Tzinfo
    let defPressureMm, defPressurePa: Int
    let slug: String
    let zoom: Int
    let nr, ns, nsr, p: Bool
    let f, h: Bool

    enum CodingKeys: String, CodingKey {
        case n, geoid, url, lat, lon, tzinfo
        case defPressureMm = "def_pressure_mm"
        case defPressurePa = "def_pressure_pa"
        case slug, zoom, nr, ns, nsr, p, f
        case h = "_h"
    }
}

// MARK: - Tzinfo
struct Tzinfo: Codable {
    let name, abbr: String
    let dst: Bool
    let offset: Int
}

// MARK: - Yesterday
struct Yesterday: Codable {
    let temp: Int
}
