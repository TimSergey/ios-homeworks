//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 12.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText = "Waiting for something..."
    
    private  let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "avatar")
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private  let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Amazing wolf"
        return label
    }()
    
    private var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Waiting for something..."
        label.textColor = .gray
        return label
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Enter your status"
        textField.textAlignment = .center
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
        print(statusTextField.text ?? "")
        statusTextField.text = ""
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Enter your status"
    }
    
    @objc func hideKeyboard() {
        endEditing(true)
    }
}

extension ProfileHeaderView {
//    enum Metric {
//        static let indentConst:CGFloat = 16
//    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.indentConst),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.indentConst),
            avatarImageView.heightAnchor.constraint(equalToConstant: Metric.avatarHeight),
            avatarImageView.widthAnchor.constraint(equalToConstant: Metric.avatarWidth),
            
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.indentNameLabel),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Metric.indentConst),
            
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.indentConst),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.indentConst),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: Metric.indentConst),
            setStatusButton.heightAnchor.constraint(equalToConstant: Metric.buttonHeight),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Metric.indentConst),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: Metric.indentConst),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: Metric.indentConst),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Metric.indentConst),
            statusTextField.trailingAnchor.constraint(equalTo: setStatusButton.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight)
        ])
    }
}
