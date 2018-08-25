//
//  RickRollViewController.swift
//  TEDTalkRater
//
//  Created by Beverly Massengill on 8/23/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import UIKit
import AVFoundation

class RickRollViewController: UIViewController {

    var player: AVAudioPlayer?
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        playDaSong()
    }
    
    // MARK: - Logic
    
    func playDaSong() {
        
        guard let url = Bundle.main.url(forResource: "rickroll", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func stopButtonTapped() {
        
        player?.stop()
        dismiss(animated: true, completion: nil)
    }
}

