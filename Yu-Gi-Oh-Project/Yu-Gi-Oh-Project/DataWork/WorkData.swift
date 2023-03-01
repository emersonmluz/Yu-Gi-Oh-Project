//
//  DataWork.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 24/02/23.
//

import AVFoundation
import UIKit

final class WorkData: TitleScreenInteractorWorkData {
    internal weak var workError: TitleScreenWorkDataError?
    
    internal func saveData(data: CardModel) {
        dataBase.save(cardModel: data) { error in
            if error != nil {
                self.workError?.workError()
            }
        }
    }
    
    internal func loadData() {
        dataBase.loadData() { error in
            if error != nil {
                self.workError?.workError()
            }
        }
    }
    
    internal func deleteData() {
        dataBase.deleteData() { error in
            if error != nil {
                self.workError?.workError()
            }
        }
    }
    
    internal func loadSounds(completion: @escaping ((AVAudioPlayer?) -> Void)) {
        do {
            guard let url = Bundle.main.url(forResource: Constants.Sounds.Names.touchScreen, withExtension: Constants.Sounds.Format.mp3) else {
                completion(nil)
                return
            }
            let audioFile = try AVAudioPlayer.init(contentsOf: url)
            completion(audioFile)
        } catch {
            completion(nil)
        }
    }
}
