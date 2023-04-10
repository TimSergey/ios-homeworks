//
//  FeedViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 09.04.2023.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 12
        button.setTitle("Мои посты", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(showMyPost), for: .touchUpInside)
    }
    
    @objc func showMyPost() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
