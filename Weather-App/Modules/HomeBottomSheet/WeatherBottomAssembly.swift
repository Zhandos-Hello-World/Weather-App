//
//  WeatherBottomAssembly.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 19.11.2022.
//

import Foundation
import UIKit

final class WeatherBottomAssembly {
    static let assembler: WeatherBottomAssembly = .init()
    private init() {}
    
    private lazy var network: NetworkService = Network()
    private lazy var homeService: WeatherServiceProtocol = WeatherService(client: network)
    
    
    func weatherBottomVC() -> UIViewController {
        let presenter = WeatherBottomSheetPresenter(service: homeService)
        let view = WeatherBottomSheetViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
