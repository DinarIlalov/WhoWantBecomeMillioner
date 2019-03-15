//
//  UserQuestionsViewController.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 06/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import UIKit

class UserQuestionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var userQuestions: [Question] = Game.shared.userQuestions
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let questionController = segue.destination as? QuestionViewController,
            segue.identifier == "toQuestionsDetails" {
            guard let cell = (sender as? UserQuestionsTableViewCell) else { return }
            
            questionController.question = cell.question
            let indexPath = tableView.indexPath(for: cell) ?? IndexPath(row: 0, section: 0)
            questionController.onEditEnd = { [weak self] question in
                self?.userQuestions[indexPath.row] = question
                self?.tableView.reloadRows(at: [indexPath], with: .right)
            }
            
        } else if let navController = segue.destination as? UINavigationController,
            let questionController = navController.topViewController as? QuestionViewController,
            segue.identifier == "toQeustionCreate" {
            questionController.onEditEnd = { [weak self] question in
                self?.userQuestions.append(question)
                let newRow = (self?.userQuestions.count ?? 0) - 1
                self?.tableView.insertRows(at: [IndexPath(row: newRow, section: 0)], with: .bottom)
            }
        }
    }

    @IBAction func backButtonDidTap(_ sender: Any) {
        Game.shared.userQuestions = userQuestions
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension UserQuestionsViewController: UITableViewDelegate {
    
}

extension UserQuestionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserQuestionsTableViewCell else {
            return UITableViewCell()
        }
        
        let question = userQuestions[indexPath.row]
        cell.question = question
        cell.configure()
        
        return cell
        
    }
    
}
