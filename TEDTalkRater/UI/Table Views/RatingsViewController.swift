//
//  RatingsViewController.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/26/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import DataManager

class RatingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noRatingsLabel: UILabel!
    var ratedTalks: [TEDTalk] = []
    let reuseIdentifier = "reuseIdentifier"
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        loadRatedTalks()
        
        noRatingsLabel.isHidden = !ratedTalks.isEmpty
        tableView.isHidden = ratedTalks.isEmpty
    }
    
    // MARK: - Data Load
    
    func loadRatedTalks() {
        
        ratedTalks = DataManager.fetchObjects(entity: TEDTalk.self, context: DataManager.mainContext)
        tableView.reloadData()
    }
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ratedTalks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        let talk = ratedTalks[indexPath.row]
        cell.textLabel?.text = talk.titleText
        cell.detailTextLabel?.text = "\(talk.rating)" + Constants.Labels.starsLabel
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let talk = ratedTalks[indexPath.row]
        let talkDetailsVC = TalkDetailsViewController(tedTalk: talk)
        
        navigationController?.pushViewController(talkDetailsVC, animated: true)
    }
}
