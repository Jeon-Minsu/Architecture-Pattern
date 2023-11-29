//
//  LoginCoordinatorProtocol.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/28/23.
//

protocol LoginCoordinatorProtocol: AnyObject, CoordinatorProtocol, LoginViewControllerDelegate {
    func startLogin()
}
