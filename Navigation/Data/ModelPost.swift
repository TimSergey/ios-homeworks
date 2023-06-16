//
//  Post.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 10.04.2023.
//

import UIKit

var model = Post.makePost()

struct Post {
    let author: String
    var description: String
    let image: String
    var likes: Int
    var views: Int
    var isLike = false
    
    static func makePost() -> [Post] {
        var posts = [Post]()
        posts.append(Post(author: "Бульбазавр",
                          description: "Бульбазавра можно увидеть дремлющим при ярком солнечном свете. На его спине есть семя. На солнце семя растет и становится больше.",
                          image: "бульбазавр",
                          likes: 150,
                          views: 223))
        
        posts.append(Post(author: "Пикачу",
                          description: "Всякий раз, когда Пикачу встречает что-то новое, то может поразить это электрическим разрядом. Если вы столкнетесь, например, с почерневшими ягодами - это прямое доказательство того, что Пикачу ошибочно принял их за что-то другое.",
                          image: "пикачу",
                          likes: 100,
                          views: 209))
        
        posts.append(Post(author: "Сквиртл",
                          description: "Сквиртл использует свой панцирь не только для защиты. Такая оболочка округлой формы и канавки на ее поверхности помогают свести к минимуму сопротивление в воде, что позволяет этому Покемону плавать на высоких скоростях.",
                          image: "сквиртл",
                          likes: 80,
                          views: 105))
        
        posts.append(Post(author: "Чармандер",
                          description: "Пламя, горящее на кончике хвоста, является показателем его эмоций. Пламя колышется, когда Чармандер доволен. Если Покемон приходит в ярость, пламя горит интенсивнее.",
                          image: "чармандер",
                          likes: 150,
                          views: 300))
        return posts
    }
}
