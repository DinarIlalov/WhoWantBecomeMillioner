//
//  QuestionBuilder.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 06/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

class QuestionBuilder {
    private(set) var text: String = ""
    private(set) var correctAnswer: String = ""
    private(set) var wrongAnswer1: String = ""
    private(set) var wrongAnswer2: String = ""
    private(set) var wrongAnswer3: String = ""
    
    func build() -> Question {
        return Question(text: text,
                        correctAnswer: correctAnswer,
                        wrongAnswers: [wrongAnswer1, wrongAnswer2, wrongAnswer3])
    }
    
    /// Use in edit mode
    ///
    /// - Parameter question: question for edit
    init(with question: Question?) {
        guard let question = question else { return }
        
        self.text = question.text
        self.correctAnswer = question.correctAnswer
        self.wrongAnswer1 = question.wrongAnswers[0]
        self.wrongAnswer2 = question.wrongAnswers[1]
        self.wrongAnswer3 = question.wrongAnswers[2]
    }
    
    func setText(_ text: String) {
        self.text = text
    }
    
    func setCorrectAnswer(_ text: String) {
        self.correctAnswer = text
    }
    
    func setWrongAnswer1(_ text: String) {
        self.wrongAnswer1 = text
    }
    
    func setWrongAnswer2(_ text: String) {
        self.wrongAnswer2 = text
    }
    
    func setWrongAnswer3(_ text: String) {
        self.wrongAnswer3 = text
    }
    
    func allFieldsFilled() -> Bool {
        
        if self.text.isEmpty { return false }
        if self.correctAnswer.isEmpty { return false }
        if self.wrongAnswer1.isEmpty { return false }
        if self.wrongAnswer2.isEmpty { return false }
        if self.wrongAnswer3.isEmpty { return false }
        
        return true
    }
}
