//
//  SceneDelegate.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/15/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var coordinator: CoordinatorProtocol?
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        let navigationController = UINavigationController()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        coordinator = AppCoordinator(navigationController: navigationController)
        coordinator?.start()
    }
}
