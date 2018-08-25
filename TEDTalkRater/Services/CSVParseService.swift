//
//  CSVParseService.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/23/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation
import CSV

class CSVParseService {
    
    // MARK: - Properties
    
    static let shared = CSVParseService()
    
    let csvFileName = "CodeChallenge"
    
    // MARK: - Data Load Methods
    
    func loadCSVData(completion: @escaping (([TEDTalk]) -> Void)) {
        
        DispatchQueue.global(qos: .background).async {
            
            var tedTalks:[TEDTalk] = []
            
            defer {
                DispatchQueue.main.async {
                    completion(tedTalks)
                }
            }
            
            guard let pathForFile = Bundle.main.path(forResource: self.csvFileName, ofType: "csv"), let stream = InputStream(fileAtPath: pathForFile) else {
                
                print("Couldn't read CSV")
                return
            }
            
            do {
            
                let csv = try CSVReader(stream: stream, hasHeaderRow: true)
                
                let headerRow = csv.headerRow!
                print("\(headerRow)")
                
//                while csv.next() != nil {
                for _ in 0...100 {
                    csv.next()
                    
                    guard let title = csv["title"], let description = csv["description"] else {
                        print("Parse error")
                        return
                    }
                    
                    let talk = TEDTalk(title: title, talkDescription: description)
                    tedTalks.append(talk)
                }
            }
            catch {
                
                print("Exception during CSV parse")
            }
            
        }
    }
}
