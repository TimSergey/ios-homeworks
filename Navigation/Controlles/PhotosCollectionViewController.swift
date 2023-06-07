//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 09.05.2023.
//

import UIKit

final class PhotosCollectionViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let photosModel = Photos.showPhotos()
    
    private var initialImageRect:CGRect = .zero
    
    private lazy var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private let whiteView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.alpha = 0.7
        return view
    }()
    
    private lazy var crossButton: UIButton = {
            let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 100, y: 150, width: 100, height: 100))
            button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
            button.tintColor = .white
            button.alpha = 0
            button.addTarget(self, action: #selector(crossButtonAction), for: .touchUpInside)
            return button
        }()
    
    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        layout()
        photosCollectionView.reloadData()
    }
    
    @objc private func crossButtonAction() {
        animateImageToInitial(rect: initialImageRect)
        crossButton.removeFromSuperview()
        whiteView.removeFromSuperview()
    }
    
    // MARK: - Private func
    
    private func animateImageToInitial(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.animatingImageView.frame = rect
            self.animatingImageView.layer.cornerRadius = 0
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
        }
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(whiteView)
        view.addSubview(crossButton)
        view.addSubview(animatingImageView)
        animatingImageView.image = image
        animatingImageView.alpha = 1.0
        animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        
        UIView.animate(withDuration: 0.6) {
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
            //self.animatingImageView.layer.cornerRadius = UIScreen.main.bounds.width / 2
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.crossButton.alpha = 1
            }
        }
    }
    
    private func animateImageViewBack(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.whiteView.alpha = 0
            self.animatingImageView.frame = rect
            self.animatingImageView.layer.cornerRadius = 0
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
            self.crossButton.alpha = 0
            self.whiteView.removeFromSuperview()
        }
    }
    
    private func setupView() {
        view.addSubview(photosCollectionView)
        navigationController?.navigationBar.isHidden = false
        title = "Photo Gallery"
    }
}

// MARK: - Extension

extension PhotosCollectionViewController {
    
    private func layout() {
        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 8}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}

// MARK: - UICollectionViewDataSource 

extension PhotosCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(model: photosModel[indexPath.item])
        cell.delegate = self
        cell.setIndexPath(indexPath)
        return cell
    }
}


extension PhotosCollectionViewController: ShowFullImageDelegate {
    func didTapImage(_ image: UIImage?, imageRect: CGRect, indexPath: IndexPath) {
                let rectItem = photosCollectionView.layoutAttributesForItem(at: indexPath)
                let rectInSuperView = photosCollectionView.convert(rectItem?.frame ?? .zero, to: photosCollectionView.superview)
        initialImageRect = CGRect(x: imageRect.origin.x + rectInSuperView.origin.x,
                                          y: imageRect.origin.y + rectInSuperView.origin.y,
                                          width: imageRect.width,
                                          height: imageRect.height)
                animateImage(image, imageFrame: initialImageRect)
            }
    }
