//
//  Story.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import Foundation

class Story: Codable {
    var id: Int
    var icon: String
    var colorHex: String
    var image: String
    var description: String
    
    init(id: Int, icon: String, colorHex: String, image: String, description: String) {
        self.id = id
        self.icon = icon
        self.colorHex = colorHex
        self.image = image
        self.description = description
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
