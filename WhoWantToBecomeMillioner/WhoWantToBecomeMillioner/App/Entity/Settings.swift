//
//  Settings.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 05/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

struct Settings: Codable {
    
    let questionsOrder: QuestionsOrder
    
    static func byDefault() -> Settings {
        return Settings(questionsOrder: .inOrder)
    }
}
