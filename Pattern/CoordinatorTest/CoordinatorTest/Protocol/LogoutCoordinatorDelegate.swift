//
//  LogoutCoordinatorDelegate.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/28/23.
//

protocol LogoutCoordinatorDelegate: AnyObject {
    func didLoggedOut(_ coordinator: LogoutCoordinatorProtocol)
}
