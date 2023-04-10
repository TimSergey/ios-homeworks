//
//  PostViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 10.04.2023.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPostVC()
    }
    
    private func setupPostVC() {
            self.view.backgroundColor = .systemBackground
            self.navigationItem.title = "Заголовок поста"
        }
}
