//
//  WeatherBottomSheetViewController.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 24.09.2022.
//

import UIKit
import SnapKit

class WeatherBottomSheetViewController: UIViewController {
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather now"
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
        label.textColor = .black
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(weatherLabel)
        
        weatherLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.leading.equalToSuperview().inset(16)
        }
        
        // Do any additional setup after loading the view.
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
