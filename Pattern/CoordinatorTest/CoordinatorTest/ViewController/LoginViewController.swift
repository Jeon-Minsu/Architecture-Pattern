//
//  LoginViewController.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/15/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    weak var coordinator: LoginCoordinatorProtocol?
    weak var delegate: LoginViewControllerDelegate?
    
    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("loginview disappear")
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    // MARK: - Methods
    
    @objc private func loginButtonDidTap() {
        print("Login Button Did Tap!")
        delegate?.login()
    }
    
    private func configureUI() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
