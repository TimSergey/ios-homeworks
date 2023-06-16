//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 09.05.2023.
//

import UIKit

protocol ShowFullImageDelegate: AnyObject {
    func didTapImage(_ image: UIImage?, imageRect: CGRect, indexPath: IndexPath)
}

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ShowFullImageDelegate?
    
    private var indexPathCell = IndexPath()
    
    private lazy var photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addGesture()
        setupViews()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        photoView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        delegate?.didTapImage(photoView.image, imageRect: photoView.frame, indexPath: indexPathCell)
    }
    
    func setupCell(model: Photos) {
        photoView.image = UIImage(named: model.imageName)
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
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


