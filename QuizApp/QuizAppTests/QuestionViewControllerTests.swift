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
    
    func test_viewDidLoad_rendersOneOptions(){
        XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(options:["A1"]).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(options:["A1", "A2"]).tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_viewDidLoad_rendersOptionText(){
        XCTAssertEqual(makeSUT(options:["A1","A2"]).tableView.title(at: 0), "A1")
        XCTAssertEqual(makeSUT(options:["A2","A2"]).tableView.title(at: 1), "A2")
    }
    
    func test_optionSelected_withSingleSelection_notifiesDelegateWithLastSelection(){
        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1", "A2"]){ receivedAnswer = $0 }
        
        sut.tableView.select(at: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])
        
        sut.tableView.select(at: 1)
        XCTAssertEqual(receivedAnswer, ["A2"])
    }
    
    func test_optionDeselected_withSingleSelection_doesNotNotifyDelegateWithEmptySelection(){
        var callbackCount = 0
        let sut = makeSUT(options: ["A1", "A2"]){ _ in callbackCount += 1 }
        
        sut.tableView.select(at: 0)
        XCTAssertEqual(callbackCount, 1)
        
        sut.tableView.deselect(at: 0)
        XCTAssertEqual(callbackCount, 1)
    }
    
    func test_optionSelected_withMultipleSelectionEnabled_notifiesDelegateSelection(){

        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1", "A2"]){ receivedAnswer = $0 }
        sut.tableView.allowsMultipleSelection = true
        sut.tableView.select(at: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])

        sut.tableView.select(at: 1)
        XCTAssertEqual(receivedAnswer, ["A1", "A2"])
    }
    
    func test_optionDeselected_withMultipleSelectionEnabled_notifiesDelegateSelection(){

        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1", "A2"]){ receivedAnswer = $0 }
        sut.tableView.allowsMultipleSelection = true

        sut.tableView.select(at: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])

        sut.tableView.deselect(at: 0)
        XCTAssertEqual(receivedAnswer, [])
    }

    
    
    //MARK: - Helpers
    
    private func makeSUT(question:String = "",
                         options: [String] = [],
                         selection: @escaping ([String]) -> Void = {_ in } )  -> QuestionViewController {
        let sut = QuestionViewController(question: question, options:options, selection: selection)
        _ = sut.view
        return sut
    }
}

private extension UITableView {
    func cell(at row: Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }
    
    func title(at row: Int) -> String? {
        return cell(at: row)?.textLabel?.text
    }
    
    func select(at row: Int){
        let indexPath = IndexPath(row: row, section: 0)
        selectRow(at: indexPath, animated: false, scrollPosition: .none)
        delegate?.tableView?(self, didSelectRowAt: indexPath)
    }
    
    func deselect(at row: Int){
        let indexPath = IndexPath(row: row, section: 0)
        deselectRow(at: indexPath, animated: false)
        delegate?.tableView?(self, didDeselectRowAt: indexPath)
    }
}
