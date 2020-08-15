//
//  CurrentWeatherViewController.swift
//  WeatherApp
//
//  Created by Pavitra on 14/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func didSelectCity(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! SearchCityViewController
        print(sourceViewController.selectedSearchItem)
        
       
    }

}
