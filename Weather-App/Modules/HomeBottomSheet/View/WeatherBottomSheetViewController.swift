//
//  WeatherBottomSheetViewController.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 24.09.2022.
//

import SnapKit

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlurBackground()
        setupBottomViews()
        
        // Do any additional setup after loading the view.
    }
    
    func setupBottomViews() {
        
        [hourlyForecastLabel,
         weeklyForecastLabel,
         separatorView].forEach(view.addSubview(_:))
        setupBottomSheetViewConstraints()
    }
    
    private func setBlurBackground() {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.layer.cornerRadius = 30
        blurView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        blurView.clipsToBounds = true
        view.addSubview(blurView)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
