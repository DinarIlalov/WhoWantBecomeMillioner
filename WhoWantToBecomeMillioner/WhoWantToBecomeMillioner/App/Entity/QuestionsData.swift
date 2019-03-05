//
//  QuestionsData.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 04/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

/*
 Массив всех вопросов (имитация какой-то базы)
*/

import Foundation

extension Question {
    static func createQuestions() -> [Question] {
        
        var questions: [Question] = []
        
        let answers = ["A", "B", "C", "D"]
        
        for iterator in 1...30 {
            var answers2 = answers
            let correctAnswer = answers2.remove(at: Int.random(in: 0...3))
            let questionText = "Question N \(iterator). Correct answer = \(correctAnswer)"
            
            questions.append(Question(text: questionText, correctAnswer: correctAnswer, wrongAnswers: answers2))
        }

        return questions
    }
}
