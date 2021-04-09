//
//  Story.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import Foundation

class StoryResult: Codable {
    var result: Result
    var stories: [Story]
    
    init(result: Result, stories: [Story]) {
        self.result = result
        self.stories = stories
        
    }
    
    static func encode(story: StoryResult) -> Data? {
        var data: Data?
        
        do {
            let encoder: JSONEncoder = JSONEncoder.init()
            
            data = try encoder.encode(story)
        } catch let e {
            print(e)
        }
        
        return data
    }
    
    static func decode(data: Data) -> StoryResult? {
        var story: StoryResult?
        
        do {
            let decoder: JSONDecoder = JSONDecoder.init()
            
            story = try decoder.decode(StoryResult.self, from: data)
        } catch let e {
            print(e)
        }
        
        return story
    }
    
}


class Story: Codable {
    var id: Int
    var icon: String
    var colorHex: String
    var image: String
    var description: String
    var readed: Bool
    
    init(id: Int, icon: String, colorHex: String, image: String, description: String,readed: Bool) {
        self.id = id
        self.icon = icon
        self.colorHex = colorHex
        self.image = image
        self.description = description
        self.readed = readed
    }
    
    static func encode(story: Story) -> Data? {
        var data: Data?
        
        do {
            let encoder: JSONEncoder = JSONEncoder.init()
            
            data = try encoder.encode(story)
        } catch let e {
            print(e)
        }
        
        return data
    }
    
    static func decode(data: Data) -> Story? {
        var story: Story?
        
        do {
            let decoder: JSONDecoder = JSONDecoder.init()
            
            story = try decoder.decode(Story.self, from: data)
        } catch let e {
            print(e)
        }
        
        return story
    }
}
