//
//  Flow.swift
//  QuizEngine
//
//  Created by Abdoulaye Diallo on 7/4/22.
//

import Foundation

protocol Router {
    typealias AnswerCallback = (String) ->Void
    func routeTo(question: String, answerCallback: @escaping AnswerCallback )
    func routeTo(result: [String: String])
}

class Flow{
    private let router: Router
    private let questions: [String]
    private var result: [String: String] = [:]
    
    init(questions: [String], router: Router) {
        self.questions = questions
        self.router = router
    }
    
    func start(){
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion,answerCallback: nextCallback(from: firstQuestion))
        }else {
            self.router.routeTo(result: result)
        }
        
    }
    
    private func nextCallback(from question: String) -> Router.AnswerCallback {
        return { [weak self ]  in self?.routeNext(question: question, answer: $0)}
    }
    
    private func routeNext(question: String, answer: String){
        if let currentQuestionIndex = self.questions.firstIndex(of: question) {
            result[question] = answer
            if currentQuestionIndex+1 < questions.count {
                let nextQuestion = questions[currentQuestionIndex+1]
                router.routeTo(question: nextQuestion, answerCallback: nextCallback(from: nextQuestion))
            }else {
                router.routeTo(result: result)
            }
        }
    }
}
