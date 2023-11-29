//
//  CoordinatorProtocol.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/15/23.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
