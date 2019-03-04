//
//  Question.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 01/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

struct Quiestion {
    let text: String
    private let correctAnswer: String
    private let wrongAnswers: [String]
    let answers: [String]
    
    init(text: String, correctAnswer: String, wrongAnswers: [String]) {
        self.text = text
        self.correctAnswer = correctAnswer
        self.wrongAnswers = wrongAnswers
        
        var allAnswers = wrongAnswers
        allAnswers.append(correctAnswer)
        
        self.answers = allAnswers.shuffled()
    }
}
