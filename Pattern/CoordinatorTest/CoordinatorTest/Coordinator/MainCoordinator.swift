//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/15/23.
//

import UIKit

// 여러 ViewController에서 공유하기 위해 sturct이 아닌 class로 생성
// 메인 코디네이터가 Navigation와의 상호작용을 직접 감지하기 위해
// UINavigationControllerDelegate 프로토콜 채택
// 그리고 이를 채택하기 위한 NSObject 상속
class MainCoordinator: NSObject, Coordinator, Red, Blue {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // ViewController 인스턴스를 생성하여 NavigationController에 push
    func start() {
        navigationController.delegate = self
        
        let vc = MainViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToRedVC() {
        let child = RedCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func goToBlueVC(to productType: Int) {
        let vc = BlueViewController()
        vc.selectedProduct = productType
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    // '===' 연산자를 통해 참조하고 있는 인스턴스가 같은지 비교
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                
                break
            }
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    // didShow: 실제로 화면이 전환된 후에 호출되기 때문에, 여기에서 화면 전환 이후의 작업을 처리
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // 현재 화면 전환 상태에서 이전의 화면을 가져옴
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        // 현재 뷰 컨트롤러들에 이전의 화면이 여전히 포함되어있는지 확인하고
        // 포함되어 있따면 이는 화면이 아직 완전히 전환되지 않았음을 의미하므로 메서드 종료
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        // 만약 RedVC 라면 해당 뷰 컨트롤러에 연결된 코디네이터를 가져와서 커스터 메서드 호출
        // RedVC 에서의 작업이 완료되었음을 알리고 해당 코디네이터 정리 역할
        if let redViewController = fromViewController as? RedViewController {
            childDidFinish(redViewController.coordinator)
        }
    }
}
