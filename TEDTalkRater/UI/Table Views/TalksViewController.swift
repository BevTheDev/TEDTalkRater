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

class TalksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var tedTalks: [TEDTalk] = []
    let reuseIdentifier = "reuseIdentifier"
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
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
    
    // MARK: - UITableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tedTalks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            fatalError("Could not generate a cell")
        }
        
        cell.textLabel?.text = tedTalks[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let talk = tedTalks[indexPath.row]
        let talkDetailsVC = TalkDetailsViewController(tedTalk: talk)
        
        navigationController?.pushViewController(talkDetailsVC, animated: true)
    }
}
