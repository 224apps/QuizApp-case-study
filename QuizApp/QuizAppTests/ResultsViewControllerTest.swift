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
        XCTAssertEqual(makeSUT(answers: [makeDummyAnswer()]).tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_withCorrectAnswer_rendersCorrectAnswerCell(){
        let sut = makeSUT(answers:[PresentableAnswer(isCorrect: true)])
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath) as? CorrectAnswerCell
        
        XCTAssertNotNil(cell)
    }
    
    //MARK: - Helpers
    private func makeSUT(summary: String = "", answers: [PresentableAnswer] = []) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }
    
    private func makeDummyAnswer() -> PresentableAnswer {
        return PresentableAnswer(isCorrect: false)
    }

}
