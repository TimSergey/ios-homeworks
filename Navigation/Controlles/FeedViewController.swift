//
//  FeedViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 09.04.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    var post = Post(title: "Все посты")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layout()
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var buttonFirst: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.setTitle("First button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showMyPost), for: .touchUpInside)
        return button
    }()
            
    private lazy var buttonSecond: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.setTitle("Second button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showMyPost), for: .touchUpInside)
        return button
    }()
    
    @objc func showMyPost() {
        let postViewController = PostViewController()
        postViewController.post = post
        navigationController?.pushViewController(postViewController, animated: true)
    }
}

extension FeedViewController {
    
    enum Metric {
        static let stackViewWidtht:CGFloat = 150
        static let buttonHeight:CGFloat = 50
    }
    
    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonFirst)
        stackView.addArrangedSubview(buttonSecond)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: Metric.stackViewWidtht),
            
            buttonFirst.heightAnchor.constraint(equalToConstant: Metric.buttonHeight),
            buttonFirst.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonFirst.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            buttonSecond.heightAnchor.constraint(equalToConstant: Metric.buttonHeight),
            buttonSecond.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonSecond.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }
}
