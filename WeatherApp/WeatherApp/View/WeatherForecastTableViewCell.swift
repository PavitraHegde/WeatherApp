//
//  WeatherForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Pavitra on 16/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import UIKit

class WeatherForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherConditionValue1: UILabel!
    @IBOutlet weak var weatherConditionTitle: UILabel!
    
    @IBOutlet weak var weatherConditionValue: UILabel!
    @IBOutlet weak var weatherTitle1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
