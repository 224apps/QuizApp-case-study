//
//  ResultViewControllerTest.swift
//  QuizAppTests
//
//  Created by Abdoulaye Diallo on 7/20/22.
//

import XCTest
@testable import QuizApp

class ResultsViewControllerTest: XCTestCase {

    func test_viewDidLoad_rendersSummary(){
        XCTAssertEqual(makeSUT(summary:"a summary").headerLabel.text, "a summary")
    }
    
    func test_viewDidLoad_renderAnswers(){
        XCTAssertEqual(makeSUT(answers: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(answers: ["A1"]).tableView.numberOfRows(inSection: 0), 1)
    }
    
    //MARK: - Helpers
    private func makeSUT(summary: String = "", answers: [String] = []) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }

}
