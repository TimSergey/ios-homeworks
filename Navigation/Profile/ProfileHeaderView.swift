//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 12.04.2023.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    // MARK: - Private properties
    
    private var statusText = "Waiting for something..."
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "аватар")
        imageView.layer.cornerRadius = 75
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarTap)))
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let transparentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.circle" ), for: .normal)
        button.tintColor = .white
        button.alpha = 0
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeButtonTap)))
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private  let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Эш Кетчум"
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
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor =  #colorLiteral(red: 0.2901960784, green: 0.5215686275, blue: 0.7960784314, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Override func
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func setupView() {
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        addSubview(transparentView)
        addSubview(avatarImageView)
        addSubview(closeButton)
    }
    
    // MARK: - @objc func
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
        print(statusTextField.text ?? "")
        statusTextField.text = ""
        endEditing(true)
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Enter your status"
    }
    
    @objc func hideKeyboard() {
        endEditing(true)
    }
    
    @objc func avatarTap() {
        UIView.animate(withDuration: 0.5, animations:  {
            self.avatarImageView.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.transparentView.frame = .init(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            self.avatarImageView.center = self.transparentView.center
            self.avatarImageView.layer.cornerRadius = 0
            self.transparentView.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
            }
        }
    }
    
    @objc private func closeButtonTap() {
        UIView.animate(withDuration: 0.3, animations: {
            self.closeButton.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.avatarImageView.frame = .init(origin: CGPoint(x: Metric.indentConst, y: Metric.indentConst), size: CGSize(width: Metric.imageWidth, height: Metric.imageHeight))
                self.avatarImageView.transform = .identity
                self.transparentView.alpha = 0
                self.avatarImageView.layer.cornerRadius = Metric.imageWidth / 2
            })
        }
    }
}

// MARK: - extension

extension ProfileHeaderView {
    enum Metric {
        static let indentConst: CGFloat = 16
        static let imageHeight: CGFloat = 150
        static let imageWidth: CGFloat = 150
        static let indentNameLabel: CGFloat = 27
        static let buttonHeight: CGFloat = 50
        static let textFieldHeight: CGFloat = 40
        static let closeButtomSize: CGFloat = 30
        
    }
    
    // MARK: - Layout func
    
    private func layout() {
        NSLayoutConstraint.activate([
            
            // avatarImageView
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.indentConst),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.indentConst),
            avatarImageView.heightAnchor.constraint(equalToConstant: Metric.imageHeight),
            avatarImageView.widthAnchor.constraint(equalToConstant: Metric.imageWidth),
            
            // transparentView
            transparentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            transparentView.topAnchor.constraint(equalTo: topAnchor),
            transparentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // closeButton
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.indentConst),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.indentConst),
            closeButton.widthAnchor.constraint(equalToConstant: Metric.closeButtomSize),
            closeButton.heightAnchor.constraint(equalToConstant: Metric.closeButtomSize),
            
            // fullNameLabel
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.indentNameLabel),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Metric.indentConst),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Metric.indentConst),
            
            // statusLabel
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: Metric.indentConst),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Metric.indentConst),
            statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            
            // statusTextField
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: Metric.indentConst),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Metric.indentConst),
            statusTextField.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight),
            
            // setStatusButton
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Metric.indentConst),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Metric.indentConst),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Metric.indentConst),
            setStatusButton.heightAnchor.constraint(equalToConstant: Metric.buttonHeight),
            setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Metric.indentConst)
        ])
    }
}
