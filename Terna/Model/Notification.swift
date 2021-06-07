//
//  Notification.swift
//  Terna
//
//  Created by Luigi Scherillo on 10/04/21.
//

import Foundation

struct NotificationResult: Codable {
    var result: Result
    var notifications: [Notification]
    
    init(result: Result, notifications: [Notification]) {
        self.result = result
        self.notifications = notifications
        
    }
    
    static func encode(story: NotificationResult) -> Data? {
        var data: Data?
        
        do {
            let encoder: JSONEncoder = JSONEncoder.init()
            
            data = try encoder.encode(story)
        } catch let e {
            print(e)
        }
        
        return data
    }
    
    static func decode(data: Data) -> NotificationResult? {
        var story: NotificationResult?
        
        do {
            let decoder: JSONDecoder = JSONDecoder.init()
            
            story = try decoder.decode(NotificationResult.self, from: data)
        } catch let e {
            print(e)
        }
        
        return story
    }
    
}

struct Notification: Codable {
    var title: String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    static func encode(story: Notification) -> Data? {
        var data: Data?
        
        do {
            let encoder: JSONEncoder = JSONEncoder.init()
            
            data = try encoder.encode(story)
        } catch let e {
            print(e)
        }
        
        return data
    }
    
    static func decode(data: Data) -> Notification? {
        var story: Notification?
        
        do {
            let decoder: JSONDecoder = JSONDecoder.init()
            
            story = try decoder.decode(Notification.self, from: data)
        } catch let e {
            print(e)
        }
        
        return story
    }
    
}
