//
//  TalkDetailsViewController.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/24/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation
import UIKit

class TalkDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let titleText: String
    let descriptionText: String
    
    // MARK: - Init
    
    init(title: String, descriptionText: String) {
        
        self.titleText = title
        self.descriptionText = descriptionText
        
        super.init(nibName: TalkDetailsViewController.className(), bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("This class is not designed to be used in a storyboard")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.titleLabel.text = titleText
        self.descriptionLabel.text = descriptionText
    }
}
