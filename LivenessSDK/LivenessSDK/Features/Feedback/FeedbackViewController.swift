//
//  FeedbackViewController.swift
//  CupertinoFramework
//
//  Created by Caio França on 02/03/25.
//

import UIKit

class FeedbackViewController: CoordinatedUIViewController {
    
    private lazy var continueButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.cornerStyle = .large
        filled.baseBackgroundColor = .tintColor
        
        var attText = AttributedString.init("Continuar")
        attText.font = UIFont.systemFont(ofSize: 19.0, weight: .semibold)
        filled.attributedTitle = attText
        
        let button = UIButton(configuration: filled, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(continueButtonTapped), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
    
    
    @objc func continueButtonTapped() {
        coordinator?.presentNextStep()
    }
    
    func addButton() {
        self.view.addSubview(continueButton)
        let margins = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -16),
            continueButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Feedback"
        addButton()
    }
    
    deinit {
        print("Deinit Feedback")
    }
}
