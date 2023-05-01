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
    
    static func makePost() -> [Post] {
        var posts = [Post]()
        posts.append(Post(author: "Хищник",
                          description: "Вот так выгдядел молодой Ракета,ещё до того как встретил Грута",
                          image: "ракета",
                          likes: 151,
                          views: 223))
        
        posts.append(Post(author: "NaGiBator_3000",
                          description: "Просто ежик с шипами",
                          image: "ежик",
                          likes: 106,
                          views: 209))
        
        posts.append(Post(author: "ΜγχαммеΔ - Αλυ",
                          description: "Лисица хитрая, не садись к ней на нос!",
                          image: "лисица",
                          likes: 80,
                          views: 105))
        
        posts.append(Post(author: "Cильвестор_C_Tалоном",
                          description: "Мой братан тигр... 24 / 7 тигр...",
                          image: "львенок",
                          likes: 152,
                          views: 300))
        return posts
    }
}


let allPosts: [Post] = [
    Post(author: "Хищник", description: "Молодой Ракета", image: "ракета", likes: 15, views: 22),

    Post(author: "NaGiBator_3000", description: "Просто ежик", image: "ежик", likes: 10, views: 20),
    
    Post(author: "ΜγχαммеΔ - Αλυ", description: "Лисица хитрая", image: "лисица", likes: 8, views: 10),
    
    Post(author: "сильвестор_с_талоном", description: "Мой братан тигр", image: "тигр", likes: 15, views: 30)
]


