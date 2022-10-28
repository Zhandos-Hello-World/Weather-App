//
//  HomeViewController.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 10.09.2022.
//

import SnapKit

class HomeViewController: UIViewController {
    // ------------------------------
    // MARK: - Properties
    // ------------------------------
    var viewModel = HomeViewModel()
    private var bottomSheedVc: WeatherBottomSheetViewController? = nil
    
    // ------------------------------
    // MARK: - UI components
    // ------------------------------
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Montreal"
        label.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.regular)
        label.textColor = .white
        return label
    }()
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "19°"
        label.font = UIFont.systemFont(ofSize: 96, weight: UIFont.Weight.thin)
        label.textColor = .white
        return label
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Mostly Clear"
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        label.textColor = .gray
        return label
    }()
    
    private lazy var hlLabel: UILabel = {
        let label = UILabel()
        label.text = "H:24° L:18°"
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        label.textColor = .white
        return label
    }()
    private let homeImageView: UIImageView = {
        let image = UIImage(named: "home")
        let imageView = UIImageView(image: image!)
        return imageView
    }()
    
    // ------------------------------
    // MARK: - Life cycle
    // ------------------------------
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentBottomSheet()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupViews()
    }
    
    // ------------------------------
    // MARK: - Weather UI setup
    // ------------------------------
    
    private func presentBottomSheet() {
        bottomSheedVc = WeatherBottomSheetViewController()
        guard let bottomSheedVc = bottomSheedVc else {
            return
        }
        let nav = UINavigationController(rootViewController: bottomSheedVc)
        nav.modalPresentationStyle = .pageSheet
        nav.isModalInPresentation = true
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        present(nav, animated: true, completion: nil)
    }
    
    func setupBackground() {
        guard let image = UIImage(named: "main_background.png") else { return }
        view.backgroundColor = UIColor(patternImage: image)
        view.contentMode = UIView.ContentMode.redraw
    }
    
    func setupViews() {
        setupBackground()
        
        [cityLabel,
         temperatureLabel,
         descriptionLabel,
         hlLabel,
         homeImageView
        ].forEach(view.addSubview(_:))
                
        setupConstraints()
    }
    

    func setupConstraints() {
        cityLabel.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(64)
            make.centerX.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints {make in
            make.top.equalTo(cityLabel.snp.bottom).inset(12)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(temperatureLabel.snp.bottom)
        }
        
        hlLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }

        homeImageView.snp.makeConstraints { make in
            make.top.equalTo(hlLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
    }
}


extension UIButton.Configuration {
    public static func outline() -> UIButton.Configuration {
        var style = UIButton.Configuration.plain()
        var background = UIButton.Configuration.plain().background
        background.cornerRadius = 20
        background.strokeWidth = 1
        background.strokeColor = UIColor.systemGray5
        style.background = background
        return style
    }
}


extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
