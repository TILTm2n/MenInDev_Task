//
//  MainTabBar.swift
//  MenInDev_Test
//
//  Created by Eugene on 19.09.2022.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        
        let mainController = Builder.buildMainModule()
        let galleryController = Builder.buildGalleryModule()
        let profileController = Builder.buildProfileModule()
        
        let mainNavController = UINavigationController(rootViewController: mainController)
        let galleryNavController = UINavigationController(rootViewController: galleryController)
        let profileNavController = UINavigationController(rootViewController: profileController)
        
        mainNavController.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "Home"), tag: 0)
        galleryNavController.tabBarItem = UITabBarItem(title: "Галерея", image: UIImage(named: "Gallery"), tag: 1)
        profileNavController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "Profile"), tag: 2)
        
        viewControllers = [mainNavController, galleryNavController, profileNavController]
        
    }

}
