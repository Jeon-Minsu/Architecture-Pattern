//
//  LoginCoordinator.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/16/23.
//

import UIKit

class LoginCoordinator: BaseCoordinator, LoginCoordinatorProtocol {
    weak var delegate: LoginCoordinatorDelegate?
    
    func startLogin() {
        if let loginViewController = findLoginViewController() {
            // Use the existing login view controller
            navigationController.popToViewController(loginViewController, animated: true)
        } else {
            let viewController = LoginViewController()
            viewController.view.backgroundColor = .red
            viewController.coordinator = self
            viewController.delegate = self
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    private func findLoginViewController() -> LoginViewController? {
        for viewController in navigationController.viewControllers {
            if let loginViewController = viewController as? LoginViewController {
                return loginViewController
            }
        }
        return nil
    }
}

extension LoginCoordinator {
    func login() {
        print("LoginCoordinator에서 login 메서드가 호출되었습니다!")
        delegate?.didLoggedIn(self)
    }
}
