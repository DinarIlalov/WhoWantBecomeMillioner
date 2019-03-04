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
    private init() {}
    
    // MARK: Properties
    var session: GameSession?
}
