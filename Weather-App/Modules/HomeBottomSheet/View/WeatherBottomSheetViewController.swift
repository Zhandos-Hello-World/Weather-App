//
//  WeatherBottomSheetViewController.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 24.09.2022.
//

import SnapKit
import UIKit

class WeatherBottomSheetViewController: UIViewController {
    // ------------------------------
    // MARK: - Proporties
    // ------------------------------
    private let presenter: WeatherBottomSheetPresenterProtocol
    
    // ------------------------------
    // MARK: - UI components
    // ------------------------------
    private let hourlyForecastLabel: UILabel = {
        let label = UILabel()
        label.text = "Hourly Forecast"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .gray
        return label
    }()
    private let weeklyForecastLabel: UILabel = {
        let label = UILabel()
        label.text = "Weekly Forecast"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .gray
        return label
    }()
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private let weatherTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(WeatherTableCell.self, forCellReuseIdentifier: WeatherTableCell.identifier)
        tableView.register(WeatherTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.sectionFooterHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    // ------------------------------
    // MARK: - Init
    // ------------------------------
    init(presenter: WeatherBottomSheetPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ------------------------------
    // MARK: - Life cycle
    // ------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadView(lat: "43.22", lon: "76.85", extra: true)
        setBlurBackground()
        
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        weatherTableView.frame = view.bounds
        view.addSubview(weatherTableView)
    }
    
    // ------------------------------
    // MARK: - Setup view
    // ------------------------------
    private func setBlurBackground() {
        view.backgroundColor = UIColor.clear
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        weatherTableView.backgroundView = blurEffectView
    }


    
    func setupBottomSheetViewConstraints() {
        hourlyForecastLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(UIEdgeInsets(top: 25, left: 32, bottom: 4, right: 0))
        }
        weeklyForecastLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(UIEdgeInsets(top: 25, left: 0, bottom: 4, right: 32))
        }
        separatorView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(weeklyForecastLabel.snp.bottom)
            make.height.equalTo(0.5)
        }
    }

}

extension WeatherBottomSheetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.itemsCount
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! WeatherTableViewHeader
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableCell.identifier, for: indexPath) as! WeatherTableCell
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light)) as UIVisualEffectView
        visualEffectView.frame = CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height)
        cell.configure(with: presenter.model(for: indexPath), index: indexPath.count)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension WeatherBottomSheetViewController: WeatherBottomSheetViewProtocol {
    func updateView() {
        weatherTableView.reloadData()
    }
    
    func updateView(withLoader isLoading: Bool) {
        //TODO LOADING STATE
    }
    
    func updateView(withError message: String) {
        //TODO ERROR STATE
    }
}
