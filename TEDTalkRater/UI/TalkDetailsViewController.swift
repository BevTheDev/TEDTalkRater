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
        
        titleLabel.text = tedTalk.title
        descriptionLabel.text = tedTalk.talkDescription
        presenterLabel.text = Constants.Labels.presenterLabel + tedTalk.speaker
        
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
        
        let _ = RatedTalk(title: tedTalk.title, description: tedTalk.talkDescription, presenter: tedTalk.speaker, rating: ratingView.rating)
        DataManager.persist(synchronously: false)
    }
    
    func loadRating() {
        
        let talks = DataManager.fetchObjects(entity: RatedTalk.self, context: DataManager.mainContext)
    }
}
