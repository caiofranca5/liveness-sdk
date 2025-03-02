//
//  CoordinatorInjector.swift
//  CupertinoFramework
//
//  Created by Caio França on 02/03/25.
//

import UIKit

class CoordinatorInjector {
    weak var coordinator: Coordinator?
    
    lazy var instructionsViewController: InstructionsViewController = {
        let vc = InstructionsViewController()
        vc.coordinator = coordinator
        return vc
    }()
    
    lazy var livenessViewController: LivenessViewController = {
        let vc = LivenessViewController()
        vc.coordinator = coordinator
        return vc
    }()
    
    lazy var sendViewController: SendViewController = {
        let vc = SendViewController()
        vc.coordinator = coordinator
        return vc
    }()
    
    lazy var feedbackViewController: FeedbackViewController = {
        let vc = FeedbackViewController()
        vc.coordinator = coordinator
        return vc
    }()
}
