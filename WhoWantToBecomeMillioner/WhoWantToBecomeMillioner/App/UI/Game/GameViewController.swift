//
//  GameViewController.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 01/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var answerDButton: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: Properties
    
    // MARK: Dependicies
    weak var gameDelegate: GameControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuestion()
    }
    
    // MARK: Actions
    @IBAction func continueButtonDidTap(_ sender: Any) {
        showQuestion()
    }
    
    @IBAction func answerButtonDidTap(_ sender: UIButton) {
        if gameDelegate?.answerIsCorrect(sender.title(for: .normal) ?? "") == true {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        setAnswerButtonsAvailability(false)
    }
    
    private func showQuestion() {
        
        let question = gameDelegate?.showNext()
        
        if question == nil {
            endGame()
        }
        
        questionTextLabel.text = question?.text
        
        answerAButton.setTitle(question?.answers[0], for: .normal)
        answerBButton.setTitle(question?.answers[1], for: .normal)
        answerCButton.setTitle(question?.answers[2], for: .normal)
        answerDButton.setTitle(question?.answers[3], for: .normal)
        
        setAnswerButtons()
        
    }
    
    private func setAnswerButtons() {
        answerAButton.backgroundColor = .white
        answerBButton.backgroundColor = .white
        answerCButton.backgroundColor = .white
        answerDButton.backgroundColor = .white
        
        setAnswerButtonsAvailability(true)
    }
    
    private func setAnswerButtonsAvailability(_ isEnable: Bool) {
        answerAButton.isEnabled = isEnable
        answerBButton.isEnabled = isEnable
        answerCButton.isEnabled = isEnable
        answerDButton.isEnabled = isEnable
    }
    
    private func endGame() {
        gameDelegate?.endGame()
        dismiss(animated: true, completion: nil)
    }
}
