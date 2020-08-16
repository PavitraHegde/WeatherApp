//
//  WeatherForecastViewController.swift
//  WeatherApp
//
//  Created by Pavitra on 16/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import UIKit

class WeatherForecastViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var temperatureViewHeightConstraint: NSLayoutConstraint!
    
  //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK:- TableView DataSourcse Methods
extension WeatherForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForecastTableViewCell", for: indexPath) as! WeatherForecastTableViewCell
        return cell
    }
    
    
}

//MARK:- TableView Delegate Methods
extension WeatherForecastViewController: UITableViewDelegate {
    
}

//MARK:- CollectionView DataSourcse Methods
extension WeatherForecastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherForecastCollectionViewCell", for: indexPath) as! WeatherForecastCollectionViewCell
        return cell
    }
}

//MARK:- CollectionView Delegate Methods
extension WeatherForecastViewController: UICollectionViewDelegate {
    
}

extension WeatherForecastViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 88.0, height: collectionView.frame.height)
    }
}

//MARK:- Helper methods
extension WeatherForecastViewController {
    func initialSetup() {
        let nib = UINib(nibName: "WeatherForecastTableViewCell", bundle: nil)
        let collectionViewNib = UINib(nibName: "WeatherForecastCollectionViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WeatherForecastTableViewCell")
        collectionView.register(collectionViewNib, forCellWithReuseIdentifier: "WeatherForecastCollectionViewCell")
    }
}
