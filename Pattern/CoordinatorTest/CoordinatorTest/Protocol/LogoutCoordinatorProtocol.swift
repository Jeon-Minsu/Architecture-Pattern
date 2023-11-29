//
//  LogoutCoordinatorProtocol.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/28/23.
//

protocol LogoutCoordinatorProtocol: AnyObject, CoordinatorProtocol, LogoutViewControllerDelegate {
    func startLogout()
}
