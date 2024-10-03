//
//  AudioManager.swift
//  TeachHerATrick
//
//  Created by Dorivaldo Marques da Silva Junior on 21/02/24.
//

import AVFoundation
import SwiftUI

class AudioManager: ObservableObject {
    static let shared = AudioManager()
    
    var audioPlayer: AVAudioPlayer?
    
    init() {
        let soundURL = Bundle.main.url(forResource: "Dog_Park", withExtension: "mp3")!
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.numberOfLoops = -1 
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error loading sound file: \(error.localizedDescription)")
        }
    }
}
