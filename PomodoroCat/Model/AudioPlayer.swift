import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    let objectWillChange = PassthroughSubject<AudioPlayer, Never>()
    
    var isAudioPlaying = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var audioPlayer:AVAudioPlayer!
    
    func startPlayBack(audioUrl: URL) {
        // Audio can be played even when device is in scilent mode
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
            audioPlayer.delegate = self
            audioPlayer.play()
            isAudioPlaying = true
            
        } catch {
            print("ERROR: audioPlayer can't play sound")
        }
        
        if audioPlayer == nil {
            print("startPlayBack(): Audio player is nil")
        }
    }
    
    func stopPlayBack() {
        if audioPlayer == nil {
            print("stopPlayBack(): Audio player is nil")
        }
        
        if let player = self.audioPlayer {
            player.stop()
            print("Audio Player stops sucessfully")
        }
        
        isAudioPlaying = false
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            isAudioPlaying = false
        }
    }
    
}


