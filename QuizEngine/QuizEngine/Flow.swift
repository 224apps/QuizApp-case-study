//
//  Flow.swift
//  QuizEngine
//
//  Created by Abdoulaye Diallo on 7/4/22.
//

import Foundation

protocol Router {
    func routeTo(question: String, answerCallback: @escaping((String) ->Void))
}

class Flow{
    let router: Router
    let questions: [String]
    
    init(questions: [String], router: Router) {
        self.questions = questions
        self.router = router
    }
    
    func start(){
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion,answerCallback: routeNext(question: firstQuestion))
        }
    }
    
    func routeNext(question: String) -> (String) -> Void {
        return { [weak self ] _ in
            guard let self = self else { return }
            let currentQuestionIndex = self.questions.firstIndex(of: question)!
            let nextQuestion = self.questions[currentQuestionIndex+1]
            self.router.routeTo(question: nextQuestion, answerCallback: self.routeNext(question: nextQuestion))
        }
    }
}
