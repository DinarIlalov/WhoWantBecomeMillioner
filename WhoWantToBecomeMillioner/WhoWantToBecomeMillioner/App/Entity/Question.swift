//
//  Question.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 01/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let correctAnswer: String
    let answers: [String]
    private let wrongAnswers: [String]
    
    init(text: String, correctAnswer: String, wrongAnswers: [String]) {
        self.text = text
        self.correctAnswer = correctAnswer
        self.wrongAnswers = wrongAnswers
        
        var allAnswers = wrongAnswers
        allAnswers.append(correctAnswer)
        
        self.answers = allAnswers.shuffled()
    }
}
