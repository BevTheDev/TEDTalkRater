//
//  TalkDetailsViewController.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/24/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation
import UIKit
import Cosmos
import CoreData
import DataManager

class TalkDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var presenterLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    let tedTalk: TEDTalk
    
    // MARK: - Init
    
    init(tedTalk: TEDTalk) {
        
        self.tedTalk = tedTalk
        
        super.init(nibName: TalkDetailsViewController.className(), bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("This class is not designed to be used in a storyboard")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        titleLabel.text = tedTalk.titleText
        descriptionLabel.text = tedTalk.descriptionText
        presenterLabel.text = Constants.Labels.presenterLabel + tedTalk.presenter
        ratingView.rating = Double(tedTalk.rating)
        
        loadRating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if ratingView.rating > 0 {
            
            saveRating()
        }
        
        super.viewWillDisappear(animated)
    }
    
    // MARK: CoreData
    
    func saveRating() {
        
        if let fetchedTalk = fetchSavedRating() {
            
            fetchedTalk.rating = Int16(ratingView.rating)
        }
        else {
            
            let _ = TEDTalk(title: tedTalk.titleText, description: tedTalk.descriptionText, presenter: tedTalk.presenter, rating: ratingView.rating, context: DataManager.mainContext)
        }
        
        DataManager.persist(synchronously: false)
    }
    
    func loadRating() {
        
        guard let fetchedTalk = fetchSavedRating() else { return }
        
        ratingView.rating = Double(fetchedTalk.rating)
    }
    
    func fetchSavedRating() -> TEDTalk? {
        
        let predicate = NSPredicate(format: "%K == %@", #keyPath(TEDTalk.titleText), tedTalk.titleText)
        let fetchedResults = DataManager.fetchObjects(entity: TEDTalk.self, predicate: predicate, context: DataManager.mainContext)
        
        return fetchedResults.first
    }
}
