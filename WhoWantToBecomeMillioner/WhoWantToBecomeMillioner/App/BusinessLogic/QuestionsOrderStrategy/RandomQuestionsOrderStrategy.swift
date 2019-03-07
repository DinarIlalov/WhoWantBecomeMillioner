//
//  RandomQuestionsOrderStrategy.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 05/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

final class RandomQuestionsOrderStrategy: QuestionsOrderStrategy {
    func prepareQuestions() -> [Question] {
        let allQuestions = Game.shared.questions + Game.shared.userQuestions
        let random15 = allQuestions.shuffled().prefix(15)
        return Array(random15)
    }
}
