//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Abdoulaye Diallo on 7/7/22.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var question: String  = ""
    private var options:[String] = []
    
    convenience init(question: String, options:[String]){
        self.init()
        self.question = question
        self.options = options
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = question
    }
}

//MARK: - UITableView DataSource

extension QuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
