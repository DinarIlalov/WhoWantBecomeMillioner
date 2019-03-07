//
//  QuestionsOrder.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 05/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

enum QuestionsOrder {
    case random
    case inOrder
}

extension QuestionsOrder: Codable {
    
    enum Key: CodingKey {
        case rawValue
    }
    
    enum CodingError: Error {
        case unknownValue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .random
        case 1:
            self = .inOrder
        default:
            throw CodingError.unknownValue
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .random:
            try container.encode(0, forKey: .rawValue)
        case .inOrder:
            try container.encode(1, forKey: .rawValue)
        }
    }
    
}
