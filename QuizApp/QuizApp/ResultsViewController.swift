//
//  ResultViewController.swift
//  QuizAppTests
//
//  Created by Abdoulaye Diallo on 7/20/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    private var summary: String = ""
    
    convenience init(summary: String){
        self.init()
        self.summary = summary
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = summary
    }
}
