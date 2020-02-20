//
//  CoordinatorManager.swift
//  CoordinatorTest
//
//  Created by Mike Pujol on 2/20/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import Foundation

protocol AskAQuestionCoordinatorProtocol {
    func submit(info: AskAQuestionInfo)
}

struct CoordinatorFactory {
    static func getCoordinator(type: AskAQuestionInfo.FlowType) -> AskAQuestionCoordinatorProtocol {
        switch type {
        case .generic:
            let services = Services()
            services.dataService.info.type = type
            return AskAQuestionCoordinator(with: services)
        }
    }
}


class CoordinatorManager: NSObject {
    static let shared = CoordinatorManager()

    var currentCoordinator: BaseCoordinator?

    init(currentCoordinator: BaseCoordinator? = nil) {
        self.currentCoordinator = currentCoordinator
        super.init()
    }

    func deallocateCurrentCoordinator() {
        currentCoordinator = nil
    }
}
