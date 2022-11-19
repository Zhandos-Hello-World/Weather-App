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
    
    
//    func fetchWeather() {
//        let session = URLSession.shared
//        guard let url = URL(string: "url") else { return }
//        session.dataTask(with: url) { [weak self]  data, _, error in
//            guard let data = data else {
//                return
//            }
//
//            do {
//                let weatherModel = try JSONDecoder().decode(WeatherModel.self, from: data)
//                self?.view?.set(currentWeather: weatherModel)
//            } catch let error {
//                print("Network in decoding:", error.localizedDescription)
//            }
//        }.resume()
//    }
}
