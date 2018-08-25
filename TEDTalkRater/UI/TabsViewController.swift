//
//  TabsViewController.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/24/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class TabsViewController: UIViewController, UITabBarDelegate {
    
    // MARK: - Properties
    
    @IBOutlet var tabContainerView: UIView!
    @IBOutlet weak var talksTab: UITabBarItem!
    @IBOutlet weak var ratingsTab: UITabBarItem!
    @IBOutlet weak var tabBar: UITabBar!
    
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
        talksViewController.view.autoPinEdgesToSuperviewEdges()
        self.addChildViewController(talksViewController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tabBar.selectedItem = talksTab
        showTalksTab()
    }
    
    // MARK: - Tab Bar Delegate
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item == talksTab {
            
            showTalksTab()
        }
        else {
            
            showRatingsTab()
        }
    }
    
    // MARK: - Tab Display Methods
    
    func showTalksTab() {
        
        title = Constants.ScreenTitles.talksScreenTitle
        view.bringSubview(toFront: talksViewController.view)
    }
    
    func showRatingsTab() {
        
    }
    
    // MARK: - Just For Fun
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        // Shake gesture (Cmd + Ctrl + Z) to activate
        // Make sure your sound is on :)
        
        if motion == .motionShake {
            
            print("Shake detected. RickRolling...")
            
            let rickRoll = RickRollViewController()
            present(rickRoll, animated: true, completion: nil)
        }
    }
}
