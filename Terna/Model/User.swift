//
//  User.swift
//  Terna
//
//  Created by Luigi Audino on 10/04/21.
//

import Foundation

class User: Codable {
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    public static func encode(user: User) -> Data? {
        var data: Data?
        
        do {
            let encoder: JSONEncoder = JSONEncoder()
            data = try encoder.encode(user)
        } catch let e {
            print(e)
        }
        
        return data
    }
    
    public static func decode(data: Data) -> User? {
        var user: User?
        
        do {
            let dec: JSONDecoder = JSONDecoder()
            user = try dec.decode(User.self, from: data)
        } catch let e {
            print(e)
        }
        
        return user
    }
}
