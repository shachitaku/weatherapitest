//
//  ViewController.swift
//  weather-finder
//
//  Created by Takumi Kimura on 2018/11/09.
//  Copyright © 2018年 com.takumi0kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var info: String?
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.infoLabel?.text = self.info
        
    }


}

