//
//  InOrderQuestionsOrderStrategy.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 05/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

final class InOrderQuestionsOrderStrategy: QuestionsOrderStrategy {
    func prepareQuestions() -> [Question] {
        let allQuestions = Game.shared.questions + Game.shared.userQuestions
        let first15 = allQuestions.prefix(15)
        return Array(first15)
    }
}
