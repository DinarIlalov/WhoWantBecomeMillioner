//
//  QuestionsOrderStrategy.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 05/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

protocol QuestionsOrderStrategy {
    func prepareQuestions() -> [Question]
}
