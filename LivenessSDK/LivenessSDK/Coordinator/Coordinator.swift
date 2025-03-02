//
//  Coordinator.swift
//  CupertinoFramework
//
//  Created by Caio França on 02/03/25.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    func presentNextStep()
    func presentPreviousStep()
}

protocol CoordinatorDelegate: AnyObject {
    func navigationControllerDidDismiss()
}

enum CoordinatorSteps {
    case instructions
    case liveness
    case send
    case feedback
    case close
}

class SDKCoordinator: Coordinator {
    var navigationController: UINavigationController?
    weak var delegate: CoordinatorDelegate?
    var currentStep: CoordinatorSteps = .instructions
    var nextStep: CoordinatorSteps = .instructions
    let injector = CoordinatorInjector()
    
    init() {
        injector.coordinator = self
    }
    
    func presentNextStep() {
        switch nextStep {
        case .instructions:
            startNavigation(with: injector.instructionsViewController)
            self.currentStep = .instructions
            self.nextStep = .liveness
        case .liveness:
            push(viewController: injector.livenessViewController)
            self.currentStep = .liveness
            self.nextStep = .send
        case .send:
            push(viewController: injector.sendViewController)
            self.currentStep = .send
            self.nextStep = .feedback
        case .feedback:
            push(viewController: injector.feedbackViewController)
            self.currentStep = .feedback
            self.nextStep = .close
        case .close:
            stopNavigation()
        }
    }
    
    func presentPreviousStep() {
        switch currentStep {
        case .instructions:
            self.stopNavigation()
        case .liveness:
            popTo(injector.instructionsViewController)
            self.currentStep = .instructions
            self.nextStep = .liveness
        case .send:
            popTo(injector.livenessViewController)
            self.currentStep = .liveness
            self.nextStep = .send
        case .feedback:
            popTo(injector.sendViewController)
            self.currentStep = .send
            self.nextStep = .feedback
        case .close:
            stopNavigation()
        }
    }
}

extension SDKCoordinator {
    func startNavigation(with viewController: UIViewController) {
        guard let topViewController = UIApplication.topMostViewController() else {
            print("Error: Could not find a top view controller.")
            return
        }
        let navController = UINavigationController(rootViewController: viewController)
        navController.modalPresentationStyle = .fullScreen
        topViewController.present(navController, animated: true, completion: nil)
        self.navigationController = navController
    }
    
    func stopNavigation() {
        navigationController?.dismiss(animated: true, completion: {
            self.currentStep = .instructions
            self.nextStep = .instructions
            self.navigationController = nil
            self.delegate?.navigationControllerDidDismiss()
        })
    }
    
    func push(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func popTo(_ viewController: UIViewController) {
        navigationController?.popToViewController(viewController, animated: true)
    }
}
