//
//  ViewController.swift
//  LivenessApp
//
//  Created by Caio França on 02/03/25.
//

import UIKit
import LivenessSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: Any) {
        SDKManager.shared.startSDK()
    }
    
}

