//
//  Question.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 01/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

struct Question: Codable {
    let text: String
    let correctAnswer: String
    let answers: [Int]  // индексы ответов
    let wrongAnswers: [String]
    
    init(text: String, correctAnswer: String, wrongAnswers: [String]) {
        self.text = text
        self.correctAnswer = correctAnswer
        self.wrongAnswers = wrongAnswers
        
        // -1 - correct answer
        self.answers = [-1, 0, 1, 2].shuffled()
    }
    
    func answersText() -> [String] {
        var answersText: [String] = []
        for answerIndex in answers {
            if answerIndex == -1 {
                answersText.append(correctAnswer)
            } else {
                answersText.append(self.wrongAnswers[answerIndex])
            }
        }
        return answersText
    }
}
