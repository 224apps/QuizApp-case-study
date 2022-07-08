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
        XCTAssertEqual(makeSUT(question: "Q1").headerLabel.text, "Q1")
    }
    
    func test_viewDidLoad_withZeroOptions_rendersZeroOptions(){
        XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
    }
    
    func test_viewDidLoad_withOneOptions_rendersOneOptions(){
        XCTAssertEqual(makeSUT(options:["A1"]).tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_withOneOption_rendersOneOptionText(){
        let sut = makeSUT(options:["A1"])
      
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath)
        
        XCTAssertEqual(cell?.textLabel?.text, "A1")
    }
    
    //MARK: - Helpers
    
    private func makeSUT(question:String = "", options: [String] = []) -> QuestionViewController {
        let sut = QuestionViewController(question: question, options:options)
        _ = sut.view
        return sut
    }
}
