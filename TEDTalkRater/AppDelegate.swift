//
//  AppDelegate.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/23/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import UIKit
import DataManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setUpUI()
        setUpCoreData()
        
        return true
    }
    
    func setUpCoreData() {
        
        let storeType: PersistentStoreType = BuildEnvironment.isRunningTests() ? .inMemory : .sqLite
        let storeName = BuildEnvironment.isRunningTests() ? "TEDTalkRaterTests" : "TEDTalkRater"
        
        DataManager.setUp(withDataModelName: "TEDTalkRater", bundle: Bundle.main, persistentStoreName: storeName, persistentStoreType: storeType)
    }
    
    func setUpUI() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: TabsViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

