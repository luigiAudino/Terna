//
//  JobResult.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import Foundation

struct JobResult: Codable {
    var result: Result
    var jobs: [Job]
    
    init(result: Result, jobs: [Job]) {
        self.result = result
        self.jobs = jobs
    }
    
    static func decode(data: Data) -> JobResult? {
        var jobResult: JobResult?
        
        do {
            let decoder: JSONDecoder = JSONDecoder()
            jobResult = try decoder.decode(JobResult.self, from: data)
        }
        catch let e {
            print(e)
        }
        
        return jobResult
    }
    
    func encode(jobResult: JobResult) -> Data? {
        var data: Data?
        
        do {
            let encoder: JSONEncoder = JSONEncoder()
            data = try encoder.encode(jobResult)
        } catch let e {
            print(e)
        }
        
        return data
    }
    
}
