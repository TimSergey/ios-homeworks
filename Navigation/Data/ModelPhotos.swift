//
//  Photos.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 08.05.2023.
//

import UIKit

struct Photos {
    
    let imageName: String
    
    static func showPhotos() -> [Photos] {
        
        var allPhotos = [Photos]()
        allPhotos.append(Photos(imageName: "1"))
        allPhotos.append(Photos(imageName: "2"))
        allPhotos.append(Photos(imageName: "3"))
        allPhotos.append(Photos(imageName: "4"))
        allPhotos.append(Photos(imageName: "5"))
        allPhotos.append(Photos(imageName: "6"))
        allPhotos.append(Photos(imageName: "7"))
        allPhotos.append(Photos(imageName: "8"))
        allPhotos.append(Photos(imageName: "9"))
        allPhotos.append(Photos(imageName: "10"))
        allPhotos.append(Photos(imageName: "11"))
        allPhotos.append(Photos(imageName: "12"))
        allPhotos.append(Photos(imageName: "13"))
        allPhotos.append(Photos(imageName: "14"))
        allPhotos.append(Photos(imageName: "15"))
        allPhotos.append(Photos(imageName: "16"))
        allPhotos.append(Photos(imageName: "17"))
        allPhotos.append(Photos(imageName: "18"))
        allPhotos.append(Photos(imageName: "19"))
        allPhotos.append(Photos(imageName: "20"))
        
        return allPhotos
    }
}
