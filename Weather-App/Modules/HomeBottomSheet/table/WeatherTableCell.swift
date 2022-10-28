//
//  WeatherTableCell.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 28.10.2022.
//

import SnapKit

class WeatherTableCell: UITableViewCell {
    //MARK: UI components
    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 72 / 255.0, green: 49 / 255.0, blue: 157 / 255.0, alpha: 1)
        view.layer.cornerRadius = 30.0
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor(red: 114 / 255.0, green: 72 / 255.0, blue: 214 / 255.0, alpha: 1)
        return view
    }()
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Nov"
        return label
    }()
    private lazy var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_moon_cloud_mid_rain")
        return imageView
    }()
    private lazy var temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.text = "19°"
        return temperatureLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellView)
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        [timeLabel,
         weatherImage,
         temperatureLabel].forEach(cellView.addSubview(_:))
        setupConstraints()
    }
    
    
    
    private func setupConstraints() {
        cellView.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.trailing.leading.equalTo(cellView).inset(16)
        }
        
        weatherImage.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(8)
            make.trailing.leading.equalToSuperview().inset(16)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview().inset(16)
            make.top.equalTo(weatherImage.snp.bottom).offset(16)
        }
        
    }
}
