//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 27.04.2023.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorLabel.text = nil
        postImageView.image = nil
        descriptionLabel.text = nil
        likesLabel.text = nil
        viewsLabel.text = nil
    }
    
    func setupCell(model: Post) {
        authorLabel.text = model.author
        postImageView.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
    }
    
    // MARK: - Private func
    
    private func layout() {
        [contentWhiteView, authorLabel, postImageView, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        
        let viewInset: CGFloat = 8
        
        NSLayoutConstraint.activate([
        
            // contentWhiteView
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            
            // authorLabel
            authorLabel.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: viewInset),
            authorLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor),
            
            // postImageView
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
            postImageView.widthAnchor.constraint(equalTo: contentWhiteView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            
            // descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: postImageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: postImageView.trailingAnchor),
            
            // likesLabel
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            likesLabel.leadingAnchor.constraint(equalTo: postImageView.leadingAnchor),
            likesLabel.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor),
            
            // viewsLabel
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: postImageView.trailingAnchor),
            viewsLabel.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor)
            
        ])
    }
}
