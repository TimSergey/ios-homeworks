//
//  PrifileViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 09.04.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    private let newButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.tintColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
        setupView()
    }
    
    private func setupView() {
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: Metric.profileHeaderViewHeight),
            
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.heightAnchor.constraint(equalToConstant: Metric.buttonHeight)
        ])
    }
}

extension ProfileViewController {
    enum Metric {
        static let indentConst: CGFloat = 16
        static let imageHeight: CGFloat = 100
        static let imageWidth: CGFloat = 100
        static let indentNameLabel: CGFloat = 27
        static let buttonHeight: CGFloat = 50
        static let textFieldHeight: CGFloat = 40
        static let stackViewWidtht:CGFloat = 150
        static let profileHeaderViewHeight:CGFloat = 220
        static let logoIndent: CGFloat = 120
        static let stackViewHeight: CGFloat = 100
    }
}
