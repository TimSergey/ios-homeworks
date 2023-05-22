//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 27.04.2023.
//

import UIKit

class ProfileTableHederView: UITableViewHeaderFooterView {

    //MARK: - Properties
    
    private var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupProfileHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private func
    
    private func setupProfileHeaderView() {
        contentView.addSubview(profileHeaderView)
        
            NSLayoutConstraint.activate([
                profileHeaderView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
                profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                profileHeaderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        }
}
