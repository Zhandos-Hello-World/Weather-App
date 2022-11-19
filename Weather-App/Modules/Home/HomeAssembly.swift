//
//  HomeAssembly.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 18.11.2022.
//

import Foundation
import UIKit

final class HomeAssembly {
    static let assembler: HomeAssembly = .init()
    private init() {}
    
    private lazy var network: NetworkService = Network()
    private lazy var homeService: HomeServiceProtocol = HomeService(client: network)
    
    
    func homeVC() -> UIViewController {
        let presenter = HomeViewPresenter(service: homeService)
        let view = HomeViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
