//
//  PostViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 10.04.2023.
//

import UIKit

final class PostViewController: UIViewController {
    
    var post: Post? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPostVC()
    }
    
    private func setupPostVC() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = post != nil ? post?.title : ""
        
        let barButtom = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapOnBarButton))
        navigationItem.rightBarButtonItem = barButtom
    }
    
    @objc func tapOnBarButton() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }
}
