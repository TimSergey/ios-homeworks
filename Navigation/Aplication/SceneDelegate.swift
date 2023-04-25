//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 09.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [createFeedVC(), createLoginVC()]
        tabBarController.tabBar.tintColor = UIColor.blue
        tabBarController.tabBar.backgroundColor = .systemGray3
        tabBarController.tabBar.unselectedItemTintColor = .black
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        window.windowScene = windowScene
        window.makeKeyAndVisible()
        
        self.window = window
    }
    
    func createFeedVC() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Лента новостей"
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "newspaper.circle"), tag: 0)
        return UINavigationController(rootViewController: feedViewController)
    }
    
//    func createProfileVC() -> UINavigationController {
//        let profileViewController = ProfileViewController()
//        profileViewController.title = "Профиль"
//        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
//
//        return UINavigationController(rootViewController: profileViewController)
//    }
    
    func createLoginVC() -> UINavigationController {
        let loginViewController = LogInViewController()
        loginViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
        return UINavigationController(rootViewController: loginViewController)
    }
    
}

