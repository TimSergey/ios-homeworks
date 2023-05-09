//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 08.05.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    var imageView1: UIImageView!
    var imageView2: UIImageView!
    var imageView3: UIImageView!
    var imageView4: UIImageView!
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Photos"
        label.tintColor = .black
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image =  UIImage(systemName: "arrow.right")
        imageView.tintColor = .black
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addPhoto()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addPhoto() {
        imageView1 = createImageView(nameImageView: "imageView1", nameImage: "1")
        imageView2 = createImageView(nameImageView: "imageView2", nameImage: "2")
        imageView3 = createImageView(nameImageView: "imageView3", nameImage: "3")
        imageView4 = createImageView(nameImageView: "imageView4", nameImage: "4")
    }
}

extension PhotosTableViewCell {
    
    func createImageView(nameImageView: String, nameImage: String) -> UIImageView {
        let nameImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.cornerRadius = 6
            imageView.image = UIImage(named: nameImage)
            imageView.clipsToBounds = true
            return imageView
        }()
        return nameImageView
    }
    
    func layout() {
        
        [contentWhiteView, photosLabel, arrowImageView, imageView1, imageView2, imageView3, imageView4].forEach { contentView.addSubview($0) }
        
        let viewInset: CGFloat = 8
        let indentConst: CGFloat = 12
        let photoSize: CGFloat = (UIScreen.main.bounds.width - 48) / 4
        let arrowSize: CGFloat = 25
        
        NSLayoutConstraint.activate([
        
            // contentWhiteView
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // photosLabel
            photosLabel.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: indentConst),
            photosLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: indentConst),
            
            // arrowImageView
            arrowImageView.heightAnchor.constraint(equalToConstant: arrowSize),
            arrowImageView.widthAnchor.constraint(equalToConstant: arrowSize),
            arrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -indentConst),
            
            // imageView1
            imageView1.heightAnchor.constraint(equalToConstant: photoSize),
            imageView1.widthAnchor.constraint(equalToConstant: photoSize),
            imageView1.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: indentConst),
            imageView1.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: indentConst),
            imageView1.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -indentConst),
            
            // imageView2
            imageView2.heightAnchor.constraint(equalToConstant: photoSize),
            imageView2.widthAnchor.constraint(equalToConstant: photoSize),
            imageView2.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: indentConst),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: viewInset),
            imageView2.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -indentConst),
            
            // imageView3
            imageView3.heightAnchor.constraint(equalToConstant: photoSize),
            imageView3.widthAnchor.constraint(equalToConstant: photoSize),
            imageView3.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: indentConst),
            imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor, constant: viewInset),
            imageView3.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -indentConst),
            
            // imageView4
            imageView4.heightAnchor.constraint(equalToConstant: photoSize),
            imageView4.widthAnchor.constraint(equalToConstant: photoSize),
            imageView4.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: indentConst),
            imageView4.leadingAnchor.constraint(equalTo: imageView3.trailingAnchor, constant: viewInset),
            imageView4.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -indentConst),
            imageView4.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -indentConst)
        ])
    }
}
