//
//  Memento.swift
//  WhoWantToBecomeMillioner
//
//  Created by Dinar Ilalov on 06/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

class Memento<T: Codable> {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let storageKey: String
    
    init(withKey storageKey: String) {
        self.storageKey = storageKey
    }
    
    func save(_ entity: [T]) throws {
        let data = try self.encoder.encode(entity)
        UserDefaults.standard.set(data, forKey: self.storageKey)
    }
    
    func load() throws -> [T] {
        guard let data = UserDefaults.standard.data(forKey: self.storageKey) else {
            return []
        }
        return try self.decoder.decode([T].self, from: data)
    }
    
    func save(_ entity: T) throws {
        let data = try self.encoder.encode(entity)
        UserDefaults.standard.set(data, forKey: self.storageKey)
    }
    
    func load() throws -> T? {
        guard let data = UserDefaults.standard.data(forKey: self.storageKey) else {
            return nil
        }
        return try self.decoder.decode(T.self, from: data)
    }
}
