//
//  HomeViewModel.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 17.09.2022.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func updateView()
    
    func updateView(withLoader isLoading: Bool)
    
    func updateView(withError message: String)
}

protocol HomeViewPresenterProtocol {
    var view: HomeViewProtocol? { get set }
    
    func loadView(lat: String, lon: String, apiKey: String, units: String, lang: String)
    
    func model() -> HomeModelProtocol?
}

class HomeViewPresenter: HomeViewPresenterProtocol {
    private let service: HomeServiceProtocol
    weak var view: HomeViewProtocol?
    private var homeModel: HomeModelProtocol? = nil
    
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    func loadView(lat: String, lon: String, apiKey: String, units: String, lang: String) {
        view?.updateView(withLoader: true)
        service.getWeather(lat: lat, lon: lon, apiKey: apiKey, units: units, lang: lang, completion: { [weak self] result in
            self?.view?.updateView(withLoader: false)
            switch result {
            case .success(let homeResponse):
                self?.homeModel = HomeModel(homeResponse: homeResponse)
                self?.view?.updateView()
            case .failure(let error):
                self?.view?.updateView(withError: error.localizedDescription)
            }
        })
    }
    
    func model() -> HomeModelProtocol? {
        return homeModel
    }
}
