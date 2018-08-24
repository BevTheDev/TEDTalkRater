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
    
    func loadCSVData() {
        
        guard let pathForFile = Bundle.main.path(forResource: csvFileName, ofType: "csv"), let stream = InputStream(fileAtPath: pathForFile) else {
            
            print("Couldn't read CSV")
            return
        }
        
        do {
        
            let csv = try CSVReader(stream: stream, hasHeaderRow: true)
            
            let headerRow = csv.headerRow!
            print("\(headerRow)")
            
//            while let row = csv.next() {
//                print("\(row)")
//            }
        }
        catch {
            
            print("Exception during CSV parse")
        }
    }
}
