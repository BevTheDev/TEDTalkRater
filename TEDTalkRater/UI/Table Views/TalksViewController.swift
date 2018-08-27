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

class TalksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var tedTalks: [TEDTalk] = []
    var filteredTalks: [TEDTalk] = []
    let reuseIdentifier = "reuseIdentifier"
    var isFiltering = false
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpAccessibility()
        
        noDataLabel.text = Constants.Labels.loadingLabel
        
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
    
    override func viewWillDisappear(_ animated: Bool) {
        
        exitFilterMode()
        
        super.viewWillDisappear(animated)
    }
    
    func handleDataChange() {
        
        noDataLabel.isHidden = !tedTalks.isEmpty
        tableView.isHidden = tedTalks.isEmpty
        
        guard !tedTalks.isEmpty else { return }
        
        tableView.reloadData()
    }
    
    func setUpAccessibility() {
        
        tableView.accessibilityLabel = Constants.Accessibility.talksTable
        searchBar.accessibilityLabel = Constants.Accessibility.searchBar
    }
    
    // MARK: - UITableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = isFiltering ? filteredTalks.count : tedTalks.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            fatalError("Could not generate a cell")
        }
        
        let talk = isFiltering ? filteredTalks[indexPath.row] : tedTalks[indexPath.row]
        
        cell.textLabel?.text = talk.titleText
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let talk = isFiltering ? filteredTalks[indexPath.row] : tedTalks[indexPath.row]
        let talkDetailsVC = TalkDetailsViewController(tedTalk: talk)
        
        navigationController?.pushViewController(talkDetailsVC, animated: true)
    }
    
    // MARK: - Search Bar Methods
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        isFiltering = true
        
        if searchText.isEmpty {
            filteredTalks = tedTalks
        }
        else {
            filteredTalks = tedTalks.filter({$0.titleText.lowercased().contains(searchText.lowercased())})
        }
        
        tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        exitFilterMode()
        
        tableView.reloadData()
    }
    
    func exitFilterMode() {
        
        isFiltering = false
        filteredTalks = []
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
