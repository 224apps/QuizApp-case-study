//
//  QuestionViewControllerTests.swift
//  QuizAppTests
//
//  Created by Abdoulaye Diallo on 7/7/22.
//

import XCTest
@testable import QuizApp

class QuestionViewControllerTests: XCTestCase {

    func test_viewDidLoad_rendersQuestionHeaderText(){
        let sut = QuestionViewController(question: "Q1")
        
        _ = sut.view
        
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }
}
