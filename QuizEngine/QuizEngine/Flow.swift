//
//  Flow.swift
//  QuizEngine
//
//  Created by Abdoulaye Diallo on 7/4/22.
//

import Foundation

protocol Router {}

class Flow{
    let router: Router
    let questions: [String]
    
    init(questions: [String], router: Router) {
        self.questions = questions
        self.router = router
    }
    
    func start(){}
}
