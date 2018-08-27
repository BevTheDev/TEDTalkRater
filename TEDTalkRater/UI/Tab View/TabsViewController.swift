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
    @IBOutlet weak var shakeGestureButton: UIButton!
    
    var talksViewController: TalksViewController
    var ratingsViewController: RatingsViewController
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        self.talksViewController = TalksViewController()
        self.ratingsViewController = RatingsViewController()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("This class is not designed to be used in a storyboard")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tabContainerView.addSubview(ratingsViewController.view)
        ratingsViewController.view.autoPinEdgesToSuperviewEdges()
        self.addChildViewController(ratingsViewController)
        
        tabContainerView.addSubview(talksViewController.view)
        talksViewController.view.autoPinEdgesToSuperviewEdges()
        self.addChildViewController(talksViewController)
        
        shakeGestureButton.isHidden = !BuildEnvironment.isRunningTests()
        
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
        tabContainerView.bringSubview(toFront: talksViewController.view)
    }
    
    func showRatingsTab() {
        
        title = Constants.ScreenTitles.ratingsScreenTitle
        tabContainerView.bringSubview(toFront: ratingsViewController.view)
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
    
    @IBAction func triggerShakePressed() {
        
        motionEnded(.motionShake, with: nil)
    }
}
