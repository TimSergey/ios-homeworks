//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 12.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText = ""
    
    private  let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private  let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Amazing wolf"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var statusTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Enter your status"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(photoImageView)
        addSubview(userNameLabel)
        addSubview(statusTextLabel)
        addSubview(statusButton)
        addSubview(statusTextField)
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusTextField.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let indentConst:CGFloat = 16
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: indentConst),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: indentConst),
            photoImageView.heightAnchor.constraint(equalToConstant: 100),
            photoImageView.widthAnchor.constraint(equalToConstant: 100),

            userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userNameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: indentConst),
            
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: indentConst),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -indentConst),
            statusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: indentConst),
            statusButton.heightAnchor.constraint(equalToConstant: 50),

            statusTextLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: indentConst),
            statusTextLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: indentConst),
            
            statusTextField.topAnchor.constraint(equalTo: statusTextLabel.bottomAnchor, constant: indentConst),
            statusTextField.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: indentConst),
            statusTextField.trailingAnchor.constraint(equalTo: statusButton.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func buttonPressed() {
        statusTextLabel.text = statusText
        statusTextField.text = ""
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Enter your status"
    }
    
    @objc func hideKeyboard() {
            endEditing(true)
        }
}
