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
    
    @IBOutlet weak var currentQuestionLabel: UILabel!
    
    @IBOutlet weak var hint50to50Button: UIButton!
    @IBOutlet weak var hintCallFrienButton: UIButton!
    @IBOutlet weak var hintAuditoryHelpButton: UIButton!
    
    // MARK: Properties
    var gameOver: Bool = false
    
    // MARK: Dependicies
    weak var gameDelegate: GameControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuestion()
        
        Game.shared.session?.currentQuestionIndex
            .addObserver(self, options: [.new, .initial]) { [weak self] (newValue, _) in
                self?.currentQuestionLabel.text = "Question № \(newValue + 1):"
        }
    }
    
    // MARK: Actions
    @IBAction func continueButtonDidTap(_ sender: Any) {
        if gameOver {
            endGame()
        } else {
            showQuestion()
        }
    }
    
    @IBAction func answerButtonDidTap(_ sender: UIButton) {
        if gameDelegate?.answerIsCorrect(sender.title(for: .normal) ?? "") == true {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
            if gameDelegate?.answerIsCorrect(answerAButton.title(for: .normal) ?? "") == true {
                answerAButton.backgroundColor = .green
            }
            if gameDelegate?.answerIsCorrect(answerBButton.title(for: .normal) ?? "") == true {
                answerBButton.backgroundColor = .green
            }
            if gameDelegate?.answerIsCorrect(answerCButton.title(for: .normal) ?? "") == true {
                answerCButton.backgroundColor = .green
            }
            if gameDelegate?.answerIsCorrect(answerDButton.title(for: .normal) ?? "") == true {
                answerDButton.backgroundColor = .green
            }
            showEndGameAlert()
            gameOver = true
        }
        setAnswerButtonsAvailability(false)
        
        continueButton.isEnabled = true
    }
    
    @IBAction func hintButtonDidTap(_ sender: UIButton) {
        switch sender {
        case hint50to50Button:
            Game.shared.session?.hintUsageFacade.use50to50Hint()
        case hintCallFrienButton:
            Game.shared.session?.hintUsageFacade.callFriend()
        case hintAuditoryHelpButton:
            Game.shared.session?.hintUsageFacade.useAuditoryHelp()
        default:
            return
        }
        setupView()
    }
    
    private func setupView() {
        hint50to50Button.isEnabled = !(Game.shared.session?.hintUsageFacade.is50to50HintUsed ?? true)
        hintCallFrienButton.isEnabled = !(Game.shared.session?.hintUsageFacade.isCallFriendHintUsed ?? true)
        hintAuditoryHelpButton.isEnabled = !(Game.shared.session?.hintUsageFacade.isAuditoryHelpHintUsed ?? true)
    }
    
    private func showEndGameAlert() {
        let gameOverLabel = UILabel(frame: .zero)
        gameOverLabel.translatesAutoresizingMaskIntoConstraints = false
        gameOverLabel.text = "You lose!"
        gameOverLabel.font = UIFont.systemFont(ofSize: 35)
        gameOverLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        gameOverLabel.sizeToFit()
        view.addSubview(gameOverLabel)
        gameOverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        gameOverLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setAnswerButtonsTitle(_ question: Question?) {
        let answers = question?.answersText()
        answerAButton.setTitle(answers?[0], for: .normal)
        answerBButton.setTitle(answers?[1], for: .normal)
        answerCButton.setTitle(answers?[2], for: .normal)
        answerDButton.setTitle(answers?[3], for: .normal)
    }
    
    private func showQuestion() {
        
        let question = gameDelegate?.showNext()
        
        if question == nil {
            endGame()
        }
        
        questionTextLabel.text = question?.text
        
        setAnswerButtonsTitle(question)
        
        setAnswerButtons()
        
        continueButton.isEnabled = false
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
        Game.shared.session = nil
        dismiss(animated: true, completion: nil)
    }
}
