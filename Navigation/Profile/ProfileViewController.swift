//
//  PrifileViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 09.04.2023.
//

import UIKit

//import UIKit
//
//final class ProfileViewController: UIViewController {
//
//    private var profileHeaderView: ProfileHeaderView = {
//        let profileHeaderView = ProfileHeaderView()
//        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
//        return profileHeaderView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .secondarySystemBackground
//        view.addSubview(profileHeaderView)
//        setupView()
//    }
//
//    private func setupView() {
//        NSLayoutConstraint.activate([
//            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            profileHeaderView.heightAnchor.constraint(equalToConstant: Metric.profileHeaderViewHeight),
//        ])
//    }
//}
//
//extension ProfileViewController {
//    enum Metric {
//        static let indentConst: CGFloat = 16
//        static let imageHeight: CGFloat = 100
//        static let imageWidth: CGFloat = 100
//        static let indentNameLabel: CGFloat = 27
//        static let buttonHeight: CGFloat = 50
//        static let textFieldHeight: CGFloat = 40
//        static let stackViewWidtht:CGFloat = 150
//        static let profileHeaderViewHeight:CGFloat = 220
//        static let logoIndent: CGFloat = 120
//        static let stackViewHeight: CGFloat = 100
//    }
//}
final class ProfileViewController: UIViewController {
    
    private let postArray = [post1,post2,post3,post4]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
