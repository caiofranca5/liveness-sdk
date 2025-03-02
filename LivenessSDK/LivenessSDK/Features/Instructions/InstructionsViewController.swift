//
//  InstructionsViewController.swift
//  CupertinoFramework
//
//  Created by Caio França on 02/03/25.
//

import UIKit

class InstructionsViewController: CoordinatedUIViewController, InstructionsViewDelegate {
    
    let contentView = InstructionsView()
    
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
    }
    
    func didTapContinue() {
        self.coordinator?.presentNextStep()
    }
    
    deinit {
        print("Deinit Instructions")
    }
}
