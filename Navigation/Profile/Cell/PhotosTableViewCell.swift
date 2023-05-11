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
    
    // MARK: - Private properties
    
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
    
    // MARK: - Override init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addPhoto()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func addPhoto() {
        imageView1 = createImageView(nameImageView: "imageView1", nameImage: "1")
        imageView2 = createImageView(nameImageView: "imageView2", nameImage: "2")
        imageView3 = createImageView(nameImageView: "imageView3", nameImage: "3")
        imageView4 = createImageView(nameImageView: "imageView4", nameImage: "4")
    }
}

// MARK: - Extension

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
        
        NSLayoutConstraint.activate([
        
            // contentWhiteView
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // photosLabel
            photosLabel.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: Metric.indentConst),
            photosLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: Metric.indentConst),
            
            // arrowImageView
            arrowImageView.heightAnchor.constraint(equalToConstant: Metric.arrowSize),
            arrowImageView.widthAnchor.constraint(equalToConstant: Metric.arrowSize),
            arrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -Metric.indentConst),
            
            // imageView1
            imageView1.heightAnchor.constraint(equalToConstant: Metric.photoSize),
            imageView1.widthAnchor.constraint(equalToConstant: Metric.photoSize),
            imageView1.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: Metric.indentConst),
            imageView1.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: Metric.indentConst),
            imageView1.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -Metric.indentConst),
            
            // imageView2
            imageView2.heightAnchor.constraint(equalToConstant: Metric.photoSize),
            imageView2.widthAnchor.constraint(equalToConstant: Metric.photoSize),
            imageView2.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: Metric.indentConst),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: Metric.viewInset),
            imageView2.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -Metric.indentConst),
            
            // imageView3
            imageView3.heightAnchor.constraint(equalToConstant: Metric.photoSize),
            imageView3.widthAnchor.constraint(equalToConstant: Metric.photoSize),
            imageView3.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: Metric.indentConst),
            imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor, constant: Metric.viewInset),
            imageView3.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -Metric.indentConst),
            
            // imageView4
            imageView4.heightAnchor.constraint(equalToConstant: Metric.photoSize),
            imageView4.widthAnchor.constraint(equalToConstant: Metric.photoSize),
            imageView4.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: Metric.indentConst),
            imageView4.leadingAnchor.constraint(equalTo: imageView3.trailingAnchor, constant: Metric.viewInset),
            imageView4.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -Metric.indentConst),
            imageView4.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -Metric.indentConst)
        ])
    }
}

// MARK: - Metric

extension PhotosTableViewCell {
    
    enum Metric {
        static let viewInset: CGFloat = 8
        static let indentConst: CGFloat = 12
        static let photoSize: CGFloat = (UIScreen.main.bounds.width - 48) / 4
        static let arrowSize: CGFloat = 25
    }
}
