//
//  LogInViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 23.04.2023.
//

import UIKit

final class LogInViewController: UIViewController {
    
    // MARK: - Pvivate properties
    
    private let login = "admin"
    private let password = "admin123"
    
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
    
    private lazy var loginTextField: UITextField = {
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
    
    private let labelWarning: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.backgroundColor = .systemGray4
        label.text = "password must be more than 5 characters"
        label.layer.cornerRadius = 10
        label.textColor = .systemGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.isHidden = true
        return label
    }()
    
    // MARK: - Override func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        addSubview()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeybord), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Private func
    
    private func addSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        contentView.addSubview(loginButton)
        contentView.addSubview(labelWarning)
    }
    
    // MARK: - @objc func
    
    @objc func pressLoginButton() {
        
        guard let loginText = loginTextField.text, let passwordText = passwordTextField.text else { return }
        
        if loginText.isEmpty {
            stackView.shakeTextField(loginTextField)
        } else if passwordText.isEmpty {
            stackView.shakeTextField(passwordTextField)
        } else if passwordText.count < 5 {
            labelWarning.isHidden = false
            labelWarning.shake()
        } else if loginText == "admin" && passwordText == "admin123" {
            let profileViewController = ProfileViewController()
            navigationController?.pushViewController(profileViewController, animated: true)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Логин: admin, пароль: admin123 ", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height + loginButton.frame.height
        }
    }
    
    @objc func willHideKeybord(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
}

// MARK: - extension

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
    
    // MARK: - Layout func
    
    private func layout() {
        NSLayoutConstraint.activate([
            
            // scrollView
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // logoImageView
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metric.logoIndent),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: Metric.imageHeight),
            logoImageView.widthAnchor.constraint(equalToConstant: Metric.imageWidth),
            
            // textField
            loginTextField.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight),
            
            // stackView
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Metric.logoIndent),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.indentConst),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.indentConst),
            stackView.heightAnchor.constraint(equalToConstant: Metric.stackViewHeight),
            
            // loginButton
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Metric.indentConst),
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            //loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: Metric.buttonHeight),
            
            //labelWarning
            labelWarning.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: Metric.indentConst),
            labelWarning.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            labelWarning.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelWarning.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor)
        ])
    }
}
