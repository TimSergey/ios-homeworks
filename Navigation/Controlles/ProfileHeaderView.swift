//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 12.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(photoImageView)
        addSubview(userNameLabel)
        addSubview(statusTextLabel)
        addSubview(statusButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            photoImageView.heightAnchor.constraint(equalToConstant: 100),
            photoImageView.widthAnchor.constraint(equalToConstant: 100),

            userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userNameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),

            statusTextLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10),
            statusTextLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34)
        ])
    }
    
    @objc func buttonPressed() {
        if let statusTextLabel = statusTextLabel.text {
            print(statusTextLabel)
        }
    }
}
