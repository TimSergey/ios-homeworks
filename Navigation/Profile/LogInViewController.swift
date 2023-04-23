//
//  LogInViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 23.04.2023.
//

import UIKit

final class LogInViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.placeholder = "Email of phone"
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.tintColor = UIColor(named: "colorSet")
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Password"
        textField.leftViewMode = .always
        textField.leftView = UIView(frame:CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.tintColor = UIColor(named: "colorSet")
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private let stackTextField: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGray4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.spacing = 1
        stackView.clipsToBounds = true
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        addSubview()
        layout()
    }
    
    private func addSubview() {
        view.addSubview(logoImageView)
        view.addSubview(stackTextField)
        stackTextField.addArrangedSubview(emailTextField)
        stackTextField.addArrangedSubview(passwordTextField)
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            
            logoImageView.heightAnchor.constraint(equalToConstant: Metric.imageHeight),
            logoImageView.widthAnchor.constraint(equalToConstant: Metric.imageWidth),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Metric.logoIndent),
            
            emailTextField.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight),
            
            
            stackTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.indentConst),
            stackTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metric.indentConst),
            stackTextField.heightAnchor.constraint(equalToConstant: Metric.stackViewHeight),
            stackTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Metric.logoIndent),
        ])
    }
}

extension LogInViewController {
    enum Metric {
        static let indentConst: CGFloat = 16
        static let imageHeight: CGFloat = 100
        static let imageWidth: CGFloat = 100
        static let buttonHeight: CGFloat = 50
        static let textFieldHeight: CGFloat = 49.5
        static let logoIndent: CGFloat = 120
        static let stackViewHeight: CGFloat = 100
    }
}
