//
//  Assembly.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 18.11.2022.
//

import Foundation
import UIKit

final class Assembly {
    static let assembler: Assembly = .init()
    private init() {}
    
    private lazy var network: NetworkService = Network()
    private lazy var homeService: HomeServiceProtocol = HomeService(client: network)
    
    
    private func homeModule() -> UIViewController {
        let presenter = HomeViewPresenter(service: homeService)
        let view = HomeViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
