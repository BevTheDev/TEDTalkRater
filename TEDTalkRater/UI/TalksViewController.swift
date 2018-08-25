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
    
    var tedTalks: [TEDTalk] = []
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        handleDataChange()
        
        MBProgressHUD.showAdded(to: view, animated: true)
        
        CSVParseService.shared.loadCSVData { talks in
            
            print("Loaded \(talks.count) CSV items")
            
            self.tedTalks = talks
            self.handleDataChange()
            
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func handleDataChange() {
        
        noDataLabel.isHidden = !tedTalks.isEmpty
        tableView.isHidden = tedTalks.isEmpty
        
        guard !tedTalks.isEmpty else { return }
        
        tableView.reloadData()
    }
}
