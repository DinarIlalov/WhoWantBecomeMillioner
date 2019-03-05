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
    private var currentQuestionIndex: Int = -1
    
    init() {
        let random15 = Question.createQuestions().shuffled().dropFirst(15)
        self.questions = Array(random15)
    }
    
}

// MARK: - GameControllerDelegate
extension GameSession: GameControllerDelegate {
    func showNext() -> Question? {
        if currentQuestionIndex + 1 >= questions.count {
            return nil
        }
        currentQuestionIndex += 1
        return questions[currentQuestionIndex]
    }
    
    func answerIsCorrect(_ answer: String) -> Bool {
        return questions[currentQuestionIndex].correctAnswer == answer
    }
    
    func endGame() {
        let record = Record.init(date: Date(), score: currentQuestionIndex + 1)
        Game.shared.addRecord(record)
    }
}
