//
//  TabsViewController.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/24/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation
import UIKit

class TabsViewController: UIViewController, UITabBarDelegate {
    
    // MARK: - Properties
    
    @IBOutlet var tabContainerView: UIView!
    @IBOutlet weak var talksTab: UITabBarItem!
    @IBOutlet weak var ratingsTab: UITabBarItem!
    
    var talksViewController: TalksViewController
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        self.talksViewController = TalksViewController()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("This class is not designed to be used in a storyboard")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tabContainerView.addSubview(talksViewController.view)
//        talksViewController.pin
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        showTalksTab()
    }
    
    // MARK: - Tab Bar Delegate
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item == talksTab {
            
        }
        else {
            
        }
    }
    
    // MARK: - Tab Display Methods
    
    func showTalksTab() {
        
        view.bringSubview(toFront: talksViewController.view)
    }
    
    func showRatingsTab() {
        
    }
}
