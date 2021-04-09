//
//  Job.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import Foundation

struct Job: Codable {
    var id: Int
    var title: String
    var description: String
    var emoji: String
    
    init(id: Int, title: String, description: String, emoji: String) {
        self.id = id
        self.title = title
        self.description = description
        self.emoji = emoji
    }
    
    static func encode(work: Job) -> Data? {
        var data: Data?
        
        do {
            let encoder: JSONEncoder = JSONEncoder.init()
            
            data = try encoder.encode(work)
        } catch let e {
            print(e)
        }
        
        return data
    }
    
    static func decode(data: Data) -> Job? {
        var work: Job?
        
        do {
            let decoder: JSONDecoder = JSONDecoder()
            work = try decoder.decode(Job.self, from: data)
        } catch let e {
            print(e)
        }
        
        return work
    }
}
