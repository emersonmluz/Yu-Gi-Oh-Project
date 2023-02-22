//
//  TitleScreenInteractor.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation

class TitleScreenInteractor: TitleScreenInteractorInterface {
    let api = ApiManager(url: Constants.NetWorking.urlCardList)
    
    internal func requestDownloadData() {
        api.fetchData() { list, error  in
            for card in list!.data {
                print(card.name)
            }
        }
    }
}
