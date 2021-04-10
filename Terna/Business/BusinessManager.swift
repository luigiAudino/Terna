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
    
    
    static func readStepMock(completion: ([Step]) -> ()) {
        
        
        var name = "Luigi"
        
        if Singleton.shared.getUser()?.email == "pierojunior.gaetani@gmail.com" {
            name = "Piero"
        }
        
        if let path = Bundle.main.path(forResource: "Roadmap-\(name)", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                if let stepsList = Steps.decode(data: data)?.steps{
                    completion(stepsList)
                }
                
            } catch let e {
                print(e)
            }
        }
    }
    
    
    static func readNotificheMock(completion: ([Notification]) -> ()) {
        if let path = Bundle.main.path(forResource: "notifiche", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                if let notifications = NotificationResult.decode(data: data)?.notifications {
                    completion(notifications)
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
    
    static func readUsersMock(completion: ([User]) -> ()) {
        if let path = Bundle.main.path(forResource: "user", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                if let users = UserResult.decode(data: data)?.users {
                    completion(users)
                }
                
            } catch let e {
                print(e)
            }
        }
    }
}
