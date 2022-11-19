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
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlurBackground()
        
        view.addSubview(weatherTableView)
        weatherTableView.backgroundColor = UIColor.clear
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        weatherTableView.frame = view.bounds
    }
    
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
        return 1
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
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
