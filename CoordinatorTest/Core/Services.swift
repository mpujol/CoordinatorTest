//
//  Services.swift
//  CoordinatorTest
//
//  Created by Mike Pujol on 2/20/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import Foundation

struct Services {
    let dataService: DataService

    init() {
        self.dataService = DataService()
    }
}

struct AskAQuestionInfo {
    var firstName: String?
    var lastName: String?
    var question: String?
    var type: FlowType

    enum FlowType {
        case generic
    }

    init(firstName: String? = nil, lastName: String? = nil, question: String? = nil, type: FlowType = .generic) {
        self.firstName = firstName
        self.lastName = lastName
        self.question = question
        self.type = type
    }
}

class DataService {
    var info: AskAQuestionInfo = AskAQuestionInfo()
}
