//
//  WeatherViewController.swift
//  weather-finder
//
//  Created by Takumi Kimura on 2018/11/09.
//  Copyright © 2018年 com.takumi0kimura. All rights reserved.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController {
    
    // APIのURLを定義
    // APPID=XXXは先程取得したAPI KEYを各自設定してください
    let key = "aa9a1da8f29e8e0b5ec1fa2a6d64f6f1"
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    
    @IBAction func weatherButtonTapped(_ sender: UIButton) {
        getWeather()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    
    func getWeather() {
        let session = URLSession.shared
        let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Atlanta,us?&units=imperial&APPID={aa9a1da8f29e8e0b5ec1fa2a6d64f6f1}")!
        let dataTask = session.dataTask(with: weatherURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("Error:\n\(error)")
            } else {
                if let data = data {
                    let dataString = String(data: data, encoding: String.Encoding.utf8)
                    print("All the weather data:\n\(dataString!)")
                    if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                        if let mainDictionary = jsonObj!.value(forKey: "main") as? NSDictionary {
                            if let temperature = mainDictionary.value(forKey: "temp") {
                                DispatchQueue.main.async {
                                    self.weatherLabel.text = "Temperature: \(temperature)℃"
                                }
                            }
                        } else {
                            print("Error: unable to find temperature in dictionary")
                        }
                    } else {
                        print("Error: unable to convert json data")
                    }
                } else {
                    print("Error: did not receive data")
                }
            }
        }
        dataTask.resume()
    }
    
    
}

