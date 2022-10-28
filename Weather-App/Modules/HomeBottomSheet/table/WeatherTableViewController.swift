//
//  WeatherTableViewController.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 28.10.2022.
//

import SnapKit

class WeatherTableViewController: UICollectionView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableCell

        return cell
    }
}
