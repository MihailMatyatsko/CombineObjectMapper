//
//  SceneDelegate.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        guard let window = window else { return }
        
        window.windowScene = windowScene
        window.rootViewController = createRootTabBarController()
        window.makeKeyAndVisible()
    }
    
    //MARK: - TabBarViewController
    private func createRootTabBarController() -> UITabBarController {
        let mainViewController = MainViewController()
        mainViewController.viewModel = MainViewModelImpl()
        mainViewController.tabBarItem = createTabBarItem(
            title: "ObjectMapper",
            image: UIImage(systemName: "suit.club.fill"),
            tag: 0
        )
        
        let combineViewController = CombineViewController()
        combineViewController.viewModel = CombineViewModelImpl()
        combineViewController.tabBarItem = createTabBarItem(
            title: "Combine",
            image: UIImage(systemName: "snow"),
            tag: 1
        )
        
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.backgroundImage = UIImage()
        tabBarVC.tabBar.shadowImage = UIImage()
        
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.darkGray
        tabBarVC.tabBar.standardAppearance = appearance
        tabBarVC.tabBar.tintColor = UIColor.orange
        
        if #available(iOS 15.0, *) {
            tabBarVC.tabBar.scrollEdgeAppearance = tabBarVC.tabBar.standardAppearance
        }
        tabBarVC.setViewControllers([mainViewController, combineViewController], animated: true)
        
        return tabBarVC
    }
            
    private func createTabBarItem(title: String, image: UIImage?, tag: Int) -> UITabBarItem {
        let item = UITabBarItem(title: title, image: image, tag: tag)
        
        return item
    }
    
}
