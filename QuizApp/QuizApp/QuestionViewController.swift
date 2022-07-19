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
    
    private var question = ""
    private var options = [String]()
    private let reuseIdentifier = "Cell"
    private var selection: (([String]) -> Void)? = nil
    
    convenience init(question: String, options:[String],selection: @escaping ([String]) -> Void){
        self.init()
        self.question = question
        self.options = options
        self.selection = selection
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = question
    }
    
    private func dequeueCell(in tableView: UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier){
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    private func selectedOptions(in tableView: UITableView) -> [String] {
        guard let indexPaths = tableView.indexPathsForSelectedRows else { return  []}
        return indexPaths.map{ options[$0.row]}
    }
}

//MARK: - UITableView DataSource

extension QuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueCell(in: tableView)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
}

//MARK: - UITableView Delegate

extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(selectedOptions(in: tableView))
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        selection?(selectedOptions(in: tableView))
//    }
}
