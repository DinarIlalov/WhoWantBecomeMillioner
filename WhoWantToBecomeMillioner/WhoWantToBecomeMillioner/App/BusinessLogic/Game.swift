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
    
    private(set) var records: [Record] = [] {
        didSet {
            try? self.recordsStorage.saveRecords(self.records)
        }
    }
    
    private let recordsStorage = RecordsStorage()
    
    // MARK: Init
    private init() {
        self.records = (try? self.recordsStorage.loadRecords()) ?? []
    }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
}
