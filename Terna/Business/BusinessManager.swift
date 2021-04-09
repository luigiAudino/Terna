//
//  BusinessManager.swift
//  Terna
//
//  Created by Luigi Scherillo on 09/04/21.
//

import Foundation

class BusinessManager {
    
    static func readJobMock(completion: ([Job]) -> ()) {
        if let path = Bundle.main.path(forResource: "job", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                if let jobList = JobResult.decode(data: data)?.jobs {
                    completion(jobList)
                }
                
            } catch let e {
                print(e)
            }
        }
    }
    
    static func readStoryMock(completion: ([Story]) -> ()) {
        if let path = Bundle.main.path(forResource: "story", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                if let story = StoryResult.decode(data: data)?.stories {
                    completion(story)
                }
                
            } catch let e {
                print(e)
            }
        }
    }
    
}
