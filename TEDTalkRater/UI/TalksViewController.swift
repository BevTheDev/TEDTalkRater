//
//  TalksViewController.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/23/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import UIKit
import Foundation
import MBProgressHUD

class TalksViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        
        MBProgressHUD.showAdded(to: view, animated: true)
        
        CSVParseService.shared.loadCSVData { talks in
            
            print("Loaded \(talks.count) CSV items")
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            
            print("Shake detected. RickRolling...")
            
            let rickRoll = RickRollViewController()
            present(rickRoll, animated: true, completion: nil)
        }
    }
}
