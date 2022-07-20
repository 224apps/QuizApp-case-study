//
//  ResultViewController.swift
//  QuizAppTests
//
//  Created by Abdoulaye Diallo on 7/20/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private var summary: String = ""
    private var answers = [String]()
    
    convenience init(summary: String, answers: [String]){
        self.init()
        self.summary = summary
        self.answers = answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = summary
    }
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
}
