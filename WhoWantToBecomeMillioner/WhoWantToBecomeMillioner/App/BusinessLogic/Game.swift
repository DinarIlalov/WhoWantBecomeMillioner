//
//  Game.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 01/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

final class Game {
    
    // MARK: Singleton
    static let shared = Game()
    
    // MARK: Properties
    var session: GameSession?
    
    private let recordsStorage = Memento<Record>(withKey: "recordsKey")
    private(set) var records: [Record] = [] {
        didSet {
            try? self.recordsStorage.save(self.records)
        }
    }
    
    private let settingsStorage = Memento<Settings>(withKey: "settingsKey")
    var settings: Settings = Settings.byDefault() {
        didSet {
            try? self.settingsStorage.save(settings)
        }
    }
    
    let userQuestionsStorage = Memento<Question>(withKey: "userQuestionsKeyKey")
    var userQuestions: [Question] = [] {
        didSet {
            try? self.userQuestionsStorage.save(self.userQuestions)
        }
    }
    
    let questions: [Question] = Question.createQuestions()
    
    // MARK: Init
    private init() {
        self.records = (try? self.recordsStorage.load()) ?? []
        // TODO: двойной анврап
        self.settings = (try? self.settingsStorage.load() ?? Settings.byDefault()) ?? Settings.byDefault()
        self.userQuestions = (try? self.userQuestionsStorage.load()) ?? []
    }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
    
    func addUserQuestion(_ question: Question) {
        self.userQuestions.append(question)
    }
}
