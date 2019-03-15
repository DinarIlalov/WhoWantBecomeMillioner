//
//  GameSession.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 01/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

final class GameSession {
    
    private let questions: [Question]
    private(set) var currentQuestionIndex: Observable<Int> = Observable(-1)
    
    let hintUsageFacade: HintUsageFacade = HintUsageFacade()
    
    init() {
        
        let strategy: QuestionsOrderStrategy
        if Game.shared.settings.questionsOrder == .inOrder {
            strategy = InOrderQuestionsOrderStrategy()
        } else {
            strategy = RandomQuestionsOrderStrategy()
        }
        
        self.questions = strategy.prepareQuestions()
    }
    
}

// MARK: - GameControllerDelegate
extension GameSession: GameControllerDelegate {
    func showNext() -> Question? {
        if currentQuestionIndex.value + 1 >= questions.count {
            return nil
        }
        currentQuestionIndex.value += 1
        
        let currentQuestion = questions[currentQuestionIndex.value]
        hintUsageFacade.currentQuestion = currentQuestion
        return currentQuestion
    }
    
    func answerIsCorrect(_ answer: String) -> Bool {
        return questions[currentQuestionIndex.value].correctAnswer == answer
    }
    
    func endGame() {
        let record = Record.init(date: Date(), score: currentQuestionIndex.value + 1)
        Game.shared.addRecord(record)
    }
}
