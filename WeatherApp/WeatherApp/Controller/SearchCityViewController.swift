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
    private let searchController = UISearchController()
    private let geocoder = LocationGeocoder()
    private var searchResult: [SearchResponse] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    var selectedSearchItem: SearchResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.searchBar.showsCancelButton = false
        navigationItem.titleView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension SearchCityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let searchItem = searchResult[indexPath.row]
        cell.textLabel?.text = searchItem.displayName
        return cell
    }
    
    
}

extension SearchCityViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedSearchItem = self.searchResult[indexPath.row]
        performSegue(withIdentifier: "didSelectCity", sender: nil)
        
    }
}

extension SearchCityViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        guard searchText?.isEmpty == false else {
            return
        }
        geocoder.startGeocoding(query: searchText!) { (error, response) in
            
            if let error = error {
                print(error)
            } else {
                self.searchResult = response ?? []
            }
        }
    }
    
    
}
