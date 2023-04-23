//
//  InfoViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 10.04.2023.
//

import UIKit

final class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 12
        button.setTitle("Внимание!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    @objc func showAlert() {
        let alertViewController = UIAlertController(title: "Ошибка", message: "Что-то пошло не так!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("Все ок!")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            print("Все не ок...")
        }
        
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        
        present(alertViewController, animated: true)
    }
}
