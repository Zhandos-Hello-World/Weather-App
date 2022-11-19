//
//  HomeModel.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 18.11.2022.
//

import Foundation


protocol HomeModelProtocol {
    var tempepature: Int { get }
    var description: String { get }
    var tempMin: Int { get }
    var tempMax: Int { get }
}

final class HomeModel: HomeModelProtocol {
    private let homeResponse: HomeResponse
    
    init(homeResponse: HomeResponse) {
        self.homeResponse = homeResponse
    }
    
    var tempepature: Int {
        Int(homeResponse.main.temp)
    }
    
    var tempMax: Int {
        Int(homeResponse.main.temp_max)
    }
    
    var tempMin: Int {
        Int(homeResponse.main.temp_min)
    }
    
    var description: String {
        homeResponse.weather[0].main
    }
}
