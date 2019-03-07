//
//  UserQuestionsTableViewCell.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 06/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import UIKit

class UserQuestionsTableViewCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var wrongAnswer1Label: UILabel!
    @IBOutlet weak var wrongAnswer2Label: UILabel!
    @IBOutlet weak var wrongAnswer3Label: UILabel!
    
    var question: Question!
    
    func configure() {
        
        questionLabel.text = question.text
        correctAnswerLabel.text = question.correctAnswer
        
        wrongAnswer1Label.text = question.wrongAnswers[0]
        wrongAnswer2Label.text = question.wrongAnswers[1]
        wrongAnswer3Label.text = question.wrongAnswers[2]
    }
}
