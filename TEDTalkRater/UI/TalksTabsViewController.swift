//
//  TalksTabsViewController.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/23/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import UIKit
import Foundation

class TalksTabsViewController: UIViewController {
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            
            print("Shake detected. RickRolling...")
            
            let rickRoll = RickRollViewController()
            present(rickRoll, animated: true, completion: nil)
        }
    }
}
