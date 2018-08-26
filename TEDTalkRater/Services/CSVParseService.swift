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
    
    func loadCSVData(updateHandler: @escaping (([TEDTalk]) -> Void)) {
        
        DispatchQueue.global(qos: .background).async {
            
            var tedTalks:[TEDTalk] = []
            
            // Ensure the completion is called even if something goes wrong
            defer {
                DispatchQueue.main.async {
                    updateHandler(tedTalks)
                }
            }
            
            guard let pathForFile = Bundle.main.path(forResource: self.csvFileName, ofType: "csv"), let stream = InputStream(fileAtPath: pathForFile) else {
                
                print("Couldn't read CSV")
                return
            }
            
            do {
            
                let csv = try CSVReader(stream: stream, hasHeaderRow: true)
                
                print("Starting CSV parse.")
                var counter = 0
                
                while csv.next() != nil {
                    
                    guard let title = csv["title"],
                        let description = csv["description"],
                        let speaker = csv["main_speaker"] else {
                        print("Parse error")
                        return
                    }
                    
                    counter += 1
                    
                    // These are being inserted into a nil context to prevent them from saving to CoreData until a rating is added by the user
                    let talk = TEDTalk(title: title, description: description, presenter: speaker, rating: 0)
                    tedTalks.append(talk)
                    
                    // Update the UI in batches
                    if counter % 200 == 0 {
                        
                        DispatchQueue.main.async {
                            updateHandler(tedTalks)
                        }
                    }
                }
                
                print("CSV load complete")
            }
            catch {
                
                print("Exception during CSV parse")
            }
        }
    }
}
