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
        
        XCTAssertEqual(router.routedQuestionsCount, 0)
    }
    
    func  test_start_withOneQuestion_routeToQuestion(){
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)
        
        sut.start()
        
        XCTAssertEqual(router.routedQuestionsCount, 1)
    }
    
    

    //MARK: - Helpers
    
    class RouterSpy: Router {
        var routedQuestionsCount: Int = 0
        
        func routeTo(question: String) {
            routedQuestionsCount += 1
        }
    }
}
