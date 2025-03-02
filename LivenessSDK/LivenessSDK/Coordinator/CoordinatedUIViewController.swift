//
//  CoordinatedUIViewController.swift
//  CupertinoFramework
//
//  Created by Caio França on 02/03/25.
//

import UIKit

class CoordinatedUIViewController: UIViewController {
    weak var coordinator: Coordinator?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .tintColor
    }
    
    private func setupCustomBackButton() {
        if let boldChevronImage = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)) {
            let backButton = UIBarButtonItem(image: boldChevronImage, style: .plain, target: self, action: #selector(backButtonTapped))
            navigationItem.leftBarButtonItem = backButton
        }
    }
    
    @objc func backButtonTapped() {
        coordinator?.presentPreviousStep()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomBackButton()
    }
}
