//
//  MainViewController.swift
//  CoordinatorTest
//
//  Created by Mike Pujol on 2/19/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func nextButtonPressed(_ sender: Any) {
        guard let coordinator = CoordinatorFactory.getCoordinator(type: .generic) as? BaseCoordinator else { return } 
        CoordinatorManager.shared.currentCoordinator = coordinator
        guard let currentCoordinator = CoordinatorManager.shared.currentCoordinator, let navigationController = navigationController else { return }

        currentCoordinator.onFlowCompleted = { [weak self] (services) in
            guard let self = self else { return }
            let (info) = services.dataService.info
            if case let (firstName?, lastName?, question?) = (info.firstName, info.lastName, info.question) {
                self.titleLabel.text = "Hello \(firstName) \(lastName). \(question)"
            }
            currentCoordinator.rootViewController.dismiss(animated: true, completion: CoordinatorManager.shared.deallocateCurrentCoordinator)
        }
        currentCoordinator.start()
        navigationController.present(currentCoordinator.rootViewController, animated: true, completion: nil)
    }
}
