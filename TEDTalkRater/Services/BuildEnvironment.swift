//
//  BuildEnvironment.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/26/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation

class BuildEnvironment {
    
    static func isRunningTests() -> Bool {
        
        return CommandLine.arguments.contains(Constants.Tests.testsParam)
    }
}
