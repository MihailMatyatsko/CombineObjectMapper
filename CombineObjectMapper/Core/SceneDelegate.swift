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
        let mainViewController = MainViewController()
        mainViewController.viewModel = MainViewModelImpl()
        window.rootViewController = mainViewController
        window.makeKeyAndVisible()
    }

}

