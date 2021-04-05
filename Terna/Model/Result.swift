//
//  Result.swift
//  Terna
//
//  Created by Luigi Audino on 05/04/21.
//

import Foundation

struct Result: Codable {
    var code: Int
    var description: String
    var success: Bool
    
    init(code: Int, description: String, success: Bool) {
        self.code = code
        self.description = description
        self.success = success
    }
    
    func decode(data: Data) -> Result? {
        var result: Result?
        
        do {
            let decoder: JSONDecoder = JSONDecoder.init()
            result = try decoder.decode(Result.self, from: data)
        } catch let e {
            print(e)
        }
        
        return result
    }
    
    func encode(result: Result) -> Data? {
        var data: Data?
        
        do {
            let encoder: JSONEncoder = JSONEncoder.init()
            data = try encoder.encode(result)
        } catch let e {
            print(e)
        }
        
        return data
    }
}
