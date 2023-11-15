//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/15/23.
//

import UIKit

protocol Coordinator {
    // 하위 코디네이터 저장
    var childCoordinators: [Coordinator] { get set }
    // ViewController를 표시하는 NavigationController를 저장
    var navigationController: UINavigationController { get set }
    
    // 코디네이터가 제어권을 갖게 하는 메서드
    // 코디네이터를 완전히 생성하고, 준비가 완료될 때만 활성화 가능
    func start()
}
