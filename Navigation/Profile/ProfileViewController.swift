//
//  PrifileViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 09.04.2023.
//

import UIKit

//var model = Post.makePost()

final class ProfileViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Override func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layuot()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Private func
    
    private func layuot() {
        view.addSubview(tableView)
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // tableView
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
    }
}

// MARK: - extension

extension ProfileViewController: UITableViewDataSource {
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int { return 2 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.selectionStyle = .none
            cell.setupCell(model: model[indexPath.row])
            cell.delegate = self
            cell.setIndexPath(indexPath)
            return cell
        }
    }
}

// MARK: UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = PhotosCollectionViewController()
        if indexPath.section == 0 {
            navigationController?.pushViewController(PhotosCollectionViewController(), animated: true)
        } else {
            let showPostModal = ShowPostVC()
            model[indexPath.row].views += 1
            showPostModal.setupData(model: model[indexPath.row])
            present(showPostModal, animated: true)
            tableView.reloadData()
        }
    }
}

extension ProfileViewController: CustomTableViewCellDelegate {
   
    func addLike(for model: inout [Post], indexPath: IndexPath) {
        if model[indexPath.row].isLike == false {
            model[indexPath.row].likes += 1
            model[indexPath.row].isLike = true
        }
    }
}
