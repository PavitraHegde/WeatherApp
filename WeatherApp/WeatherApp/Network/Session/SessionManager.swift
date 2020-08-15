//
//  SessionManager.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import UIKit

class SessionManager: NSObject {
    
    static let shared = SessionManager()
    
    lazy private(set) var defaultSession: URLSession = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
    

    private override init() {
        super.init()
    }
}
