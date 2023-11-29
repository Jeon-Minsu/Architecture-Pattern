//
//  AppCoordinator.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/28/23.
//

import UIKit

class AppCoordinator: BaseCoordinator, LoginCoordinatorDelegate, LogoutCoordinatorDelegate {
    var isLoggedIn: Bool = false
    
    override func start() {
        if isLoggedIn {
            showLogoutViewController()
        } else {
            showLoginViewController()
        }
    }
    
    private func showLogoutViewController() { 
        let child = LogoutCoordinator(navigationController: navigationController)
        addChildCoordinator(child)
        child.parentCoordinator = self
        child.delegate = self
        child.startLogout()
    }
    
    private func showLoginViewController() {
        let child = LoginCoordinator(navigationController: navigationController)
        addChildCoordinator(child)
        child.parentCoordinator = self
        child.delegate = self
        child.startLogin()
    }
    
    func didLoggedIn(_ coordinator: LoginCoordinatorProtocol) {
//        removeChildCoordinator(coordinator)
        showLogoutViewController()
    }
    
    func didLoggedOut(_ coordinator: LogoutCoordinatorProtocol) {
//        removeChildCoordinator(coordinator)
        showLoginViewController()
    }
}
