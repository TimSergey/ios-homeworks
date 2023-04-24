//
//  LogInViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 23.04.2023.
//

import UIKit

final class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
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
        textField.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
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
        textField.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        return textField
    }()
    
    private let stackView: UIStackView = {
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
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.backgroundColor = UIColor(named: "blue_pixel")
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.addTarget(self, action: #selector(pressLoginButton), for: .touchUpInside)
        
        switch button.state {
        case .selected: button.alpha = 0.8
        case .highlighted: button.alpha = 0.8
        case .disabled: button.alpha = 0.8
        default: button.alpha = 1
        }
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        addSubview()
        layout()
    }
    
    private func addSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        contentView.addSubview(loginButton)
    }
    
    @objc func pressLoginButton() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
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
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metric.logoIndent),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: Metric.imageHeight),
            logoImageView.widthAnchor.constraint(equalToConstant: Metric.imageWidth),
            
            emailTextField.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight),

            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Metric.logoIndent),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.indentConst),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.indentConst),
            stackView.heightAnchor.constraint(equalToConstant: Metric.stackViewHeight),
            
            
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Metric.indentConst),
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: Metric.buttonHeight)
        ])
    }
}
