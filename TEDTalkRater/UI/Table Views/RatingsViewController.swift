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
    var ratedTalks: [TEDTalk] = []
    let reuseIdentifier = "reuseIdentifier"
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        loadRatedTalks()
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            fatalError("Could not generate a cell")
        }
        
        cell.textLabel?.text = ratedTalks[indexPath.row].titleText
        
        return cell
    }
}
