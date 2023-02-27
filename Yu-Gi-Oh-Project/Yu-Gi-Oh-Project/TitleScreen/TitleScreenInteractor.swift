//
//  TitleScreenInteractor.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation
import UIKit

final class TitleScreenInteractor: TitleScreenInteractorInterface {
    internal var api = ApiManager(url: Constants.NetWorking.urlCardList)
    internal weak var output: TitleScreenInteractorOutput?
    internal var workData: TitleScreenInteractorWorkData
    internal var workInternet: TitleScreenInteractorWorkInternet
    
    init(apiInput: ApiManager = ApiManager(url: Constants.NetWorking.urlCardList), output: TitleScreenInteractorOutput? = nil, workData: TitleScreenInteractorWorkData, workInternet: TitleScreenInteractorWorkInternet) {
        self.api = apiInput
        self.output = output
        self.workData = workData
        self.workInternet = workInternet
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
}

extension TitleScreenInteractor: TitleScreenWorkDataError {
    internal func workError() {
        output?.dataError()
    }
}
