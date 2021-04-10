//
//  UserResult.swift
//  Terna
//
//  Created by Luigi Audino on 10/04/21.
//

import Foundation

class UserResult: Codable {
    var result: Result
    var users: [User]
    
    init(result: Result, users: [User]) {
        self.result = result
        self.users = users
    }
    
    public static func encode(userResult: UserResult) -> Data? {
        var data: Data?
        
        do {
            let encoder: JSONEncoder = JSONEncoder()
            data = try encoder.encode(userResult)
        } catch let e {
            print(e)
        }
        
        return data
    }
    
    public static func decode(data: Data) -> UserResult? {
        var userResult: UserResult?
        
        do {
            let dec: JSONDecoder = JSONDecoder()
            userResult = try dec.decode(UserResult.self, from: data)
        } catch let e {
            print(e)
        }
        
        return userResult
    }}
