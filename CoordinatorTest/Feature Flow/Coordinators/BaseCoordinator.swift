//
//  BaseCoordinator.swift
//  CoordinatorTest
//
//  Created by Mike Pujol on 2/20/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import UIKit

class BaseCoordinator: RootViewCoordinator {

    var services: Services

    var childCoordinators: [Coordinator] = []

    var onFlowCompleted: ((_ services: Services) -> Void)?

    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }()

    var rootViewController: UIViewController {
        return self.navigationController
    }

    init(with services: Services) {
        self.services = services
    }

    func start() {
        //default
    }
}
