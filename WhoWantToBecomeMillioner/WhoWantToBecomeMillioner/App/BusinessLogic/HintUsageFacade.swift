//
//  HintUsageFacade.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 11/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

final class HintUsageFacade {
    
    var currentQuestion: Question?
    
    var isCallFriendHintUsed = false
    var isAuditoryHelpHintUsed = false
    var is50to50HintUsed = false
    
    func callFriend() {
        guard !isCallFriendHintUsed else { return }
        isCallFriendHintUsed = true
    }
    
    func useAuditoryHelp() {
        guard !isAuditoryHelpHintUsed else { return }
        isAuditoryHelpHintUsed = true
    }
    
    func use50to50Hint() {
        guard !is50to50HintUsed else { return }
        is50to50HintUsed = true
    }
    
}
