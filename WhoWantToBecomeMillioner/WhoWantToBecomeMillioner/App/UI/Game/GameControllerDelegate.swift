//
//  GameSesseionDelegate.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 04/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

protocol GameControllerDelegate: AnyObject {
    func showNext() -> Question?
    func answerIsCorrect(_ answer: String) -> Bool
    func endGame()
}
