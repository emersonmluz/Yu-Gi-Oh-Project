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
    var dataWork: TitleScreenInteractorWork
    
    init(apiInput: ApiManager = ApiManager(url: Constants.NetWorking.urlCardList), apiOutput: TitleScreenInteractorOutput? = nil, dataWork: TitleScreenInteractorWork) {
        self.apiInput = apiInput
        self.apiOutput = apiOutput
        self.dataWork = dataWork
    }
    
    internal func requestDownloadData() {
        apiInput.fetchData() { cardList, error  in
            self.dataWork.saveData(data: cardList ?? nil)
            DispatchQueue.main.async {
                self.apiOutput?.fetchFinished(output: cardList, error: error)
            }
        }
    }
    
    internal func deleteDataBase() {
        dataWork.deleteData()
    }
}
