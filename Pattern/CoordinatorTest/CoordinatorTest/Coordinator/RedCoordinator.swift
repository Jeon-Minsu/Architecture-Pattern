//
//  RedCoordinator.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/16/23.
//

import UIKit

class RedCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = RedViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
//    func didFinish() {
//        parentCoordinator?.childDidFinish(self)
//    }
}
