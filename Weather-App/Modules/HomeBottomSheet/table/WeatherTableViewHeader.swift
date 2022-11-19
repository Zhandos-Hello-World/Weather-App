//
//  WeatherTableViewHeader.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 29.10.2022.
//

import SnapKit

class WeatherTableViewHeader: UITableViewHeaderFooterView {
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Montreal"
        label.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.regular)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "19°| Mostly Clear"
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        label.textColor = .gray
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func setupViews() {
        [cityLabel, temperatureLabel].forEach(addSubview(_:))
        setupConstraints()
    }
    
    private func setupConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.centerX.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}
