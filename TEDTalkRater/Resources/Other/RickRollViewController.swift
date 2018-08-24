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
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        playDaSong()
    }
    
    // MARK: - Logic
    
    func playDaSong() {
        
        // This is the easter egg
        // Shake gesture (Cmd + Ctrl + Z) to activate
        // Make sure your sound is on :)
        
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

