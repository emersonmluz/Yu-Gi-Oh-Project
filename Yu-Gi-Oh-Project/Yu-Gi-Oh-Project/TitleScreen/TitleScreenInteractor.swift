//
//  TitleScreenInteractor.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation

class TitleScreenInteractor: TitleScreenInteractorInterface {
    var apiInput = ApiManager(url: Constants.NetWorking.urlCardList)
    weak var apiOutput: TitleScreenInteractorOutput?
    var dataWork: TitleScreenInteractorWork?
    let dataWorkController = DataWork()
    
    internal func requestDownloadData() {
        apiInput.fetchData() { cardList, error  in
            self.dataWork?.dataBaseWork(data: cardList ?? nil)
            self.apiOutput?.fetchFinished(output: cardList, error: error)
        }
    }
}
