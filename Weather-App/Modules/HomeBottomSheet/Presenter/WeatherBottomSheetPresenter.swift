//
//  WeatherBottomSheetPresenter.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 19.11.2022.
//

import Foundation


protocol WeatherBottomSheetViewProtocol: AnyObject {
    func updateView()
    
    func updateView(withLoader isLoading: Bool)
    
    func updateView(withError message: String)
}

protocol WeatherBottomSheetPresenterProtocol {
    var itemsCount: Int { get }
    
    func loadView(lat: String, lon: String, extra: Bool)
    
    func model(for indexPath: IndexPath) -> WeatherDayModel
}

class WeatherBottomSheetPresenter: WeatherBottomSheetPresenterProtocol {
    private var forecasts: [WeatherDayModel] = []
    private let service: WeatherServiceProtocol
    var view: WeatherBottomSheetViewProtocol?
    var itemsCount: Int { forecasts.count }
    
    init(service: WeatherServiceProtocol) {
        self.service = service
    }
    
    func loadView(lat: String, lon: String, extra: Bool) {
        service.getWeather(lat: lat, lon: lon, extra: extra) { [weak self] result in
            self?.view?.updateView(withLoader: true)
            
            switch result {
            case .success(let weathers):
                self?.forecasts = weathers.forecasts.map { WeatherDayModel(forecast: $0)  }
                print(weathers.now)
                self?.view?.updateView()
            case .failure(let message):
                self?.view?.updateView(withError: message.localizedDescription)
            }
        }
    }
    
    func model(for indexPath: IndexPath) -> WeatherDayModel {
        forecasts[indexPath.row]
    }
}
