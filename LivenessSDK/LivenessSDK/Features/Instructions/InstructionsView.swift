//
//  InstructionsView.swift
//  LivenessSDK
//
//  Created by Caio França on 02/03/25.
//

import UIKit

protocol InstructionsViewDelegate: AnyObject {
    func didTapContinue()
}

class InstructionsView: UIView {
    weak var delegate: InstructionsViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Biometric Verification"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 28.0, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Find a well lit place and ensure your face is within the frame."
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var continueButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.cornerStyle = .large
        filled.baseBackgroundColor = .tintColor
        
        var attText = AttributedString.init("Start")
        attText.font = UIFont.systemFont(ofSize: 19.0, weight: .semibold)
        filled.attributedTitle = attText
        
        let button = UIButton(configuration: filled, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(continueButtonTapped), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
    
    @objc func continueButtonTapped() {
        delegate?.didTapContinue()
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupContentView() {
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(continueButton)
    }
    
    private func addConstraints() {
        let margins = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -16),
            continueButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
}
