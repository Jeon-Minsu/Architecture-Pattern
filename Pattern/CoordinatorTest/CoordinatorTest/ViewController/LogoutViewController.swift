//
//  LogoutViewController.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/15/23.
//

import UIKit

class LogoutViewController: UIViewController {
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(logoutButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    weak var coordinator: LogoutCoordinatorProtocol?
    weak var delegate: LogoutViewControllerDelegate?
    
    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("logoutview disappear")
        
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    // MARK: - Methods
    
    @objc private func logoutButtonDidTap() {
        print("Logout Button Did Tap!")
        delegate?.logout()
    }
    
    private func configureUI()  {
        view.addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

