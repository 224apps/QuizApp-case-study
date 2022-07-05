//
//  FlowTest.swift
//  QuizEngineTests
//
//  Created by Abdoulaye Diallo on 7/4/22.
//

import XCTest
@testable import QuizEngine

class FlowTest: XCTestCase {
    
    func  test_start_withNoQuestions_doesNotRouteToQuestion(){
        let router = RouterSpy()
        let sut = Flow(questions: [], router: router)
        
        sut.start()
        
        XCTAssertTrue(router.routedQuestions.isEmpty)
    }
    
    func  test_start_withOneQuestion_routeToCorrectQuestion(){
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)
        
        sut.start()
        
        XCTAssertEqual(router.routedQuestions, ["Q1"])
    }
    
    func  test_start_withTwoQuestions_routeToFirstQuestion(){
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1","Q2"], router: router)
        
        sut.start()
        
        XCTAssertEqual(router.routedQuestions, ["Q1"])
    }
    
    func  test_startTwice_withTwoQuestions_routeToFirstTwiceQuestion(){
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1","Q2"], router: router)

        sut.start()
        sut.start()

        XCTAssertEqual(router.routedQuestions, ["Q1","Q1"])
    }
    
    func  test_startAndAnswerFirstQuestion_withTwoQuestions_routeToSecondQuestion(){
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1","Q2"], router: router)
        sut.start()
        
        router.answerCallback("A1")
      
        XCTAssertEqual(router.routedQuestions, ["Q1","Q2"])
    }
    

    //MARK: - Helpers
    
    class RouterSpy: Router {
        var routedQuestions: [String] = []
        var answerCallback: ((String) ->Void) = {_ in }
        
        func routeTo(question: String, answerCallback: @escaping((String) ->Void)) {
            routedQuestions.append(question)
            self.answerCallback = answerCallback
        }
    }
}
