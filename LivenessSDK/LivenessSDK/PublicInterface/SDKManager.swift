//
//  SDKManager.swift
//  CupertinoFramework
//
//  Created by Caio França on 01/03/25.
//


import UIKit

public class SDKManager: CoordinatorDelegate {
    static public let shared = SDKManager()
    var coordinator: SDKCoordinator? = nil
    
    public func startSDK() {
        self.coordinator = SDKCoordinator()
        self.coordinator?.delegate = self
        coordinator?.presentNextStep()
    }
    
    func navigationControllerDidDismiss() {
        self.coordinator = nil
    }
}
