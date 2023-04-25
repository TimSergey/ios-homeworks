//
//  Post.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 10.04.2023.
//

import UIKit

struct Post {
    let author: String
    var description: String
    let image: String
    var likes: Int
    var views: Int
}

let post1 = Post(author: "Хищник", description: "Молодой Ракета", image: "ракета", likes: 15, views: 22)
let post2 = Post(author: "NaGiBator_3000", description: "Просто ежик", image: "ежик", likes: 10, views: 20)
let post3 = Post(author: "ΜγχαммеΔ - Αλυ", description: "Лисица хитрая", image: "лисица", likes: 8, views: 10)
let post4 = Post(author: "сильвестор_с_талоном", description: "Мой братан тигр", image: "тигр", likes: 15, views: 30)


