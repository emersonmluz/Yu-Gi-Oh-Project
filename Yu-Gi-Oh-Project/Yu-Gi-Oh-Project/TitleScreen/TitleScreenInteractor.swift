//
//  TitleScreenInteractor.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation

class TitleScreenInteractor: TitleScreenInteractorInterface {
    var api = ApiManager(url: Constants.NetWorking.urlCardList)
    weak var apiOutput: TitleScreenInteractorOutput?
    
    internal func requestDownloadData() {
        api.fetchData() { list, error  in
            self.apiOutput?.fetchFinished(output: list, error: error)
        }
    }
}
