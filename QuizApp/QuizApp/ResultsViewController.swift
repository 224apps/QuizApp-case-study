//
//  ResultViewController.swift
//  QuizAppTests
//
//  Created by Abdoulaye Diallo on 7/20/22.
//

import UIKit

struct PresentableAnswer {
    let question: String
    let answer: String
    let isCorrect: Bool
}
class CorrectAnswerCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
}

class WrongAnswerCell: UITableViewCell {
}

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private var summary: String = ""
    private var answers = [PresentableAnswer]()
    
    convenience init(summary: String, answers: [PresentableAnswer]){
        self.init()
        self.summary = summary
        self.answers = answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = summary
        tableView.register(UINib(nibName: "CorrectAnswerCell", bundle: nil), forCellReuseIdentifier: "CorrectAnswerCell")
    }
    
    //MARK: - Private Methods
    
    private func correctAnswerCell(for answer: PresentableAnswer) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CorrectAnswerCell") as! CorrectAnswerCell
        cell.questionLabel.text = answer.question
        cell.answerLabel.text = answer.answer
        return cell
    }
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        return  answer.isCorrect ? correctAnswerCell(for: answer):  WrongAnswerCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
}
