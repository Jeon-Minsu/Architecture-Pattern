//
//  BlueViewController.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/15/23.
//

import UIKit

class BlueViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    var selectedProduct = Int.max
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
    }
}
