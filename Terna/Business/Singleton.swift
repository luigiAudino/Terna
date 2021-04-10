//
//  Singleton.swift
//  Terna
//
//  Created by Luigi Audino on 11/04/21.
//

import Foundation

final class Singleton {
    private var user: User?
    
    static let shared = Singleton()
    
    private init() {}
    
    public func getUser() -> User? {
        return user
    }
    
    public func setUser(user: User) {
        self.user = user
    }
}
