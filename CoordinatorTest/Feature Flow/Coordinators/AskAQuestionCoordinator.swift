//
//  AskAQuestionCoordinator.swift
//  CoordinatorTest
//
//  Created by Mike Pujol on 2/20/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import Foundation

class AskAQuestionCoordinator: BaseCoordinator {

    // MARK: - Custom Navigation

    override func start() {
        showRedStage()
    }

    func showRedStage() {
        let redVC = RedViewController(services: services)
        redVC.coordinator = self
        navigationController.setViewControllers([redVC], animated: true)
    }

    func showGreenStage() {
        let greenVC = GreenViewController(services: services)
        greenVC.coordinator = self
        navigationController.setViewControllers([greenVC], animated: true)
    }

    func showBlueStage() {
        let blueVC = BlueViewController(services: services)
        blueVC.coordinator = self
        navigationController.setViewControllers([blueVC], animated: true)
    }
}

extension AskAQuestionCoordinator: AskAQuestionCoordinatorProtocol {
    func submit(info: AskAQuestionInfo) {
        // TODO: - MAP - API call should be done here at the end of the flow
        print("Hey Listen! - Submitted")
    }
}
