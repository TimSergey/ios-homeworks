//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 09.05.2023.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let photoView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            return imageView
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: Photos) {
        photoView.image = UIImage(named: model.imageName)
        }
    
    private func setupViews() {
        backgroundColor = .systemYellow
        layer.cornerRadius = 6
        contentView.addSubview(photoView)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
        
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
