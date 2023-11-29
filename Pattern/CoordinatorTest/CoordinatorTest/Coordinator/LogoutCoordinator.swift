//
//  LogoutCoordinator.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/15/23.
//

import UIKit

class LogoutCoordinator: BaseCoordinator, LogoutCoordinatorProtocol {
    weak var delegate: LogoutCoordinatorDelegate?
        
        func startLogout() {
            // Check if the logout view controller is already in the navigation stack
            if let logoutViewController = findLogoutViewController() {
                // Use the existing logout view controller
                navigationController.popToViewController(logoutViewController, animated: true)
            } else {
                // Create a new logout view controller
                let viewController = LogoutViewController()
                viewController.view.backgroundColor = .green
                viewController.coordinator = self
                viewController.delegate = self
                navigationController.pushViewController(viewController, animated: true)
            }
        }

        private func findLogoutViewController() -> LogoutViewController? {
            // Find the logout view controller in the navigation stack
            for viewController in navigationController.viewControllers {
                if let logoutViewController = viewController as? LogoutViewController {
                    return logoutViewController
                }
            }
            return nil
        }

        // Additional methods or properties for the LogoutCoordinator
    }
extension LogoutCoordinator {
    func logout() {
        print("LogoutCoordinator에서 logout 메서드가 호출되었습니다!")
        delegate?.didLoggedOut(self)
    }
}
