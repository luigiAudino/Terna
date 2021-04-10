//
//  Steps.swift
//  Terna
//
//  Created by Luigi Scherillo on 11/04/21.
//

import Foundation

// MARK: - Welcome
struct Steps: Codable {
    let result: Result
    let steps: [Step]
    
    public static func decode(data: Data) -> Steps? {
        var stepResult: Steps?
        
        do {
            let dec: JSONDecoder = JSONDecoder()
            stepResult = try dec.decode(Steps.self, from: data)
        } catch let e {
            print(e)
        }
        
        return stepResult
    }
    
}

// MARK: - Step
struct Step: Codable {
    let completed: Bool
    let completedPercentage: Int
    let stepTitle, stepDescription, color: String
    let isStepActive: Bool
}
