//
//  UIViewController+TEDTalkRater.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/24/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    static func className() -> String {
        
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
