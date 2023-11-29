//
//  LoginCoordinatorDelegate.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/28/23.
//

protocol LoginCoordinatorDelegate: AnyObject {
    func didLoggedIn(_ coordinator: LoginCoordinatorProtocol)
}
