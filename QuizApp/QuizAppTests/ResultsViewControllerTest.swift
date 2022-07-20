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
        let sut = ResultsViewController(summary:"a summary")
        
        _ = sut.view
   
        XCTAssertEqual(sut.headerLabel.text, "a summary")
    }
}
