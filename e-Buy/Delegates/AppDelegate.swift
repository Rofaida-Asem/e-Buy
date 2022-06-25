//
//  AppDelegate.swift
//  e-Buy
//
//  Created by Om Malikah  on 22/11/1443 AH.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    var rootViewController: UIViewController {
        let tabBarVC = TabBarViewController()
        let homeNavigationVC = UINavigationController(rootViewController: HomeViewController())
        let categoryNavigationVC = UINavigationController(rootViewController: CategoryViewController())
        tabBarVC.viewControllers = [homeNavigationVC,categoryNavigationVC]
        homeNavigationVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        categoryNavigationVC.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "square.grid.2x2"), tag: 1)
        
        return tabBarVC
    }

}

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .purple
        tabBar.tintColor = .white
       // tabBar.items?[1] = UITabBarItem(title: "Category", image: UIImage(systemName: "house"), tag: 1)
   //     navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
    }
}
