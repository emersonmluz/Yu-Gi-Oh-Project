//
//  TitleScreenInteractor.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import UIKit
import AVFoundation

final class TitleScreenInteractor: TitleScreenInteractorInterface {
    internal var api = ApiManager(url: Constants.NetWorking.urlCardList)
    internal weak var output: TitleScreenInteractorOutput?
    internal var workData: TitleScreenInteractorWorkData
    internal var workInternet: TitleScreenInteractorWorkInternet
    
    init() {
        self.workData = WorkData()
        self.workInternet = WorkInternet()
        self.workData.workError = self
    }
    
    internal func requestDownloadData() {
        api.fetchData() { cardList, error  in
            self.output?.fetchDataFinished(output: cardList, error: error)
        }
    }
    
    internal func saveDataBase(data: CardModel) {
        self.workData.saveData(data: data)
    }
    
    internal func loadDataBase() {
        workData.loadData()
    }
    
    internal func deleteDataBase() {
        workData.deleteData()
    }
    
    internal func downloadImage(card: CardModel, completion: @escaping((UIImage) -> Void)) {
        workInternet.downloadImage(card: card) { image in
            completion(image)
        }
    }
    
    internal func loadSounds(completion: @escaping((AVAudioPlayer?) -> Void)) {
        workData.loadSounds() { audio in
            completion(audio)
        }
    }
}

extension TitleScreenInteractor: TitleScreenWorkDataError {
    internal func workError() {
        output?.dataError()
    }
}
