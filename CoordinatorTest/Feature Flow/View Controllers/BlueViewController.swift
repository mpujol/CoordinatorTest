//
//  BlueViewController.swift
//  CoordinatorTest
//
//  Created by Mike Pujol on 2/19/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import UIKit

protocol BlueViewControllerDelegate: class {
    func blueViewControllerDidTapNextStep()
}

class BlueViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!

    var services: Services

    var coordinator: AskAQuestionCoordinator?

    init(services: Services) {
        self.services = services
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        guard let coordinator = coordinator else { return }
        coordinator.services.dataService.info.question = "How are you doing?"
        coordinator.submit(info: services.dataService.info)
        coordinator.onFlowCompleted?(coordinator.services)
    }

}
