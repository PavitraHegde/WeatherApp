//
//  SearchCityViewController.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import UIKit

class SearchCityViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController?.searchBar.sizeToFit()
        navigationItem.titleView = searchController?.searchBar
        definesPresentationContext = true
        searchController?.hidesNavigationBarDuringPresentation = false
    }
}

extension SearchCityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}

extension SearchCityViewController: UITableViewDelegate {
    
}
