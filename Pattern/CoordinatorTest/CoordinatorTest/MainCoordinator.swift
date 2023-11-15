//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/15/23.
//

import UIKit

// 여러 ViewController에서 공유하기 위해 sturct이 아닌 class로 생성
class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // ViewController 인스턴스를 생성하여 NavigationController에 push
    func start() {
        let vc = MainViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToRedVC() {
        let vc = RedViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToBlueVC() {
        let vc = BlueViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
