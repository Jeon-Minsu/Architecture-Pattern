//
//  BaseCoordinator.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/28/23.
//

import UIKit

class BaseCoordinator: NSObject, CoordinatorProtocol {
    weak var parentCoordinator: CoordinatorProtocol? = nil
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {}
    
    func addChildCoordinator(_ coordinator: CoordinatorProtocol) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
