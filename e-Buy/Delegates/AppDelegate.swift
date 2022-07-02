//
//  AppDelegate.swift
//  e-Buy
//
//  Created by Om Malikah  on 22/11/1443 AH.
//

import UIKit
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
     
        IQKeyboardManager.shared.enable = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    var rootViewController: UIViewController {
        let tabBarVC = TabBarViewController()
        let homeNavigationVC = UINavigationController(rootViewController: HomeViewController())
        let categoryNavigationVC = UINavigationController(rootViewController: CategoryViewController())

        homeNavigationVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        categoryNavigationVC.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "square.grid.2x2"), tag: 1)
        let loginVC = UINavigationController(rootViewController: LoginVC())
        loginVC.tabBarItem = UITabBarItem(title: "ME", image: UIImage(systemName: "person"),tag: 2)
        tabBarVC.viewControllers = [homeNavigationVC,categoryNavigationVC,loginVC]
        return tabBarVC
    }

}


