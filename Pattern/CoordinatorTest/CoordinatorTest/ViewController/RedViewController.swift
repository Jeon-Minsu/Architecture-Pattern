//
//  RedViewController.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/15/23.
//

import UIKit

class RedViewController: UIViewController {
    weak var coordinator: RedCoordinator?
    
    override func viewDidLoad() {
        view.backgroundColor = .red
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        
//        coordinator?.didFinish()
//    }
}
