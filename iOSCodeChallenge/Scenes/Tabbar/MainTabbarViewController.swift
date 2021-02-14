//
//  MainTabbarViewController.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barStyle = .default
        self.tabBar.barTintColor = Styles.Colors.idealistaMain
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.isTranslucent = false
        
        let adListVC = AdListBuilder.viewController()
        adListVC.tabBarItem = UITabBarItem.init(title: Literals.AdList.title , image: UIImage.init(named: "tabbar_adList"), tag: 0)
        let adListNavigationController = IDNavigationController.init(rootViewController: adListVC)

        let favoritesVC = FavoriteAdsListBuilder.viewController()
        favoritesVC.tabBarItem = UITabBarItem.init(title: Literals.Favorites.title , image: UIImage.init(named: "tabbar_favorites"), tag: 1)
        let favoritesNavigationController = IDNavigationController.init(rootViewController: favoritesVC)
        
        let tabBarList = [adListNavigationController, favoritesNavigationController]

        viewControllers = tabBarList
    }
    
}
