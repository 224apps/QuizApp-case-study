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
        
        XCTAssertEqual(router.routedQuestions, 0)
    }
    

    //MARK: - Helpers
    
    class RouterSpy: Router {
        var routedQuestions: Int = 0
    }
}
