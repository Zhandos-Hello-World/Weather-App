//
//  WeatherCollectionViewCell.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 02.11.2022.
//

import UIKit


class WeatherCollectionViewCell: UICollectionView {
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
        label.textColor = UIColor.white
        return label
    }()
    private lazy var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_moon_cloud_mid_rain")
        imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return imageView
    }()
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "19°"
        label.textColor = UIColor.white
        return label
    }()


    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = UIColor.clear
        addSubview(cellView)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        [timeLabel,
         weatherImage,
         temperatureLabel].forEach(addSubview(_:))
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
