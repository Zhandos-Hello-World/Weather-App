//
//  WeatherTableCell.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 28.10.2022.
//

import SnapKit

class WeatherTableCell: UITableViewCell {
    // ------------------------------
    // MARK: - Propetries
    // ------------------------------
    static let identifier = "WeatherTableCell"

    // ------------------------------
    // MARK: - UI components
    // ------------------------------
    private lazy var dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "Monday"
        label.textColor = UIColor.white
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "12 Apr"
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 72 / 255.0, green: 49 / 255.0, blue: 157 / 255.0, alpha: 1)
        view.layer.cornerRadius = 30.0
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor(red: 114 / 255.0, green: 72 / 255.0, blue: 214 / 255.0, alpha: 1)
        return view
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
    
    // ------------------------------
    // MARK: - Init
    // ------------------------------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        addSubview(cellView)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ------------------------------
    // MARK: - Setup view
    // ------------------------------
    private func setupViews() {
        [dayOfWeekLabel,
         dateLabel,
         weatherImage,
         temperatureLabel].forEach(addSubview(_:))
        setupConstraints()
    }
    
    private func setupConstraints() {
        cellView.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalToSuperview().inset(8)
        }
        
        dayOfWeekLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(cellView).inset(16)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(dayOfWeekLabel.snp.bottom)
            make.leading.bottom.equalTo(cellView).inset(16)
            
        }
        
        weatherImage.snp.makeConstraints { make in
            make.centerY.equalTo(cellView)
            make.trailing.equalTo(cellView).inset(16)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalTo(cellView)
            make.top.bottom.equalTo(cellView)
        }
    }
    
    // ------------------------------
    // MARK: - Logic
    // ------------------------------
    func configure(with weather: WeatherDayModel, index: Int) {
        if let dayOfWeek = getDayOfWeek(weather.date) {
            if let weekName = (EnumDays.init(rawValue: dayOfWeek - 1)) {
                dayOfWeekLabel.text = weekName.description
            }
        }
        dateLabel.text = getDayOfMonth(timestamp: weather.timestamp)
        temperatureLabel.text = "Day: \(weather.tempDay)° Night: \(weather.tempNight)°"
    }
    
    func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
    
    func getDayOfMonth(timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let format = date.getFormattedDate(format: "MMMM")
        return format.capitalized
    }
}

enum EnumDays: Int, CustomStringConvertible
{
    var description: String {
        switch self {
        case .MONDAY:
            return "Monday"
        case .TUESDAY:
            return "Tuesday"
        case .WEDNESDAY:
            return "Wednesday"
        case .THURSDAY:
            return "Thursday"
        case .FRIDAY:
            return "Friday"
        case .SATURDAY:
            return "Saturday"
        case .SUNDAY:
            return "Sunday"
        }
    }
    case SUNDAY, MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY,SATURDAY
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
