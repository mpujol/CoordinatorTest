//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Mike Pujol on 2/19/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import UIKit

protocol RootViewControllerProvider {
    /// The coordinators 'rootViewController'. It helps to think of this as the view
    /// controller that can be used to dismiss the coordinator from the view hierarchy.
    var rootViewController: UIViewController { get }
}

protocol Coordinator: class {

    /// This is a common requirment for coordinators but since we aren't implementing this app-wide
    /// we most likely will set to empty till you intend on nesting it at some point in the future
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func addChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }

    func removeChildCoordinators(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
}

typealias RootViewCoordinator = Coordinator & RootViewControllerProvider
