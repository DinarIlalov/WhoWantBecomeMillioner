//
//  QuestionViewController.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 06/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var correctAnswerTextField: UITextField!
    @IBOutlet weak var wrongAnswer1TextField: UITextField!
    @IBOutlet weak var wrongAnswer2TextField: UITextField!
    @IBOutlet weak var wrongAnswer3TextField: UITextField!
    
    private var questionBuilder: QuestionBuilder?
    
    var question: Question?
    var onEditEnd: ((Question) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionBuilder = QuestionBuilder(with: question)
        setupData()
        addCancelButton()
    }
    
    @IBAction func saveButtonDidTap(_ sender: UIBarButtonItem) {
        
        guard questionBuilder?.allFieldsFilled() == true else {
            
            let alert = UIAlertController(title: "Error", message: "All fields must be filled. Question don't saved!", preferredStyle: .alert)
            let okeyButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okeyButton)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let isQuestionCreation = self.question == nil
        
        self.question = questionBuilder?.build()
        if let question = self.question {
            onEditEnd?(question)
        }
        if isQuestionCreation {
            self.navigationController?.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        let isQuestionCreation = self.question == nil
        
        if isQuestionCreation {
            self.navigationController?.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func setupData() {
        guard let question = self.question else {
            return
        }
        
        questionTextField.text = question.text
        correctAnswerTextField.text = question.correctAnswer
        wrongAnswer1TextField.text = question.wrongAnswers[0]
        wrongAnswer2TextField.text = question.wrongAnswers[1]
        wrongAnswer3TextField.text = question.wrongAnswers[2]
    }
    
    private func addCancelButton() {
        
        let isQuestionCreation = self.question == nil
        
        if isQuestionCreation {
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonDidTap(_:)))
            navigationItem.leftBarButtonItem = cancelButton
        }
    }
}

extension QuestionViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch textField {
        case questionTextField:
            questionBuilder?.setText(textField.text ?? "")
        case correctAnswerTextField:
            questionBuilder?.setCorrectAnswer(textField.text ?? "")
        case wrongAnswer1TextField:
            questionBuilder?.setWrongAnswer1(textField.text ?? "")
        case wrongAnswer2TextField:
            questionBuilder?.setWrongAnswer2(textField.text ?? "")
        case wrongAnswer3TextField:
            questionBuilder?.setWrongAnswer3(textField.text ?? "")
        default:
            return
        }
    }
}
