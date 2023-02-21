//
//  TitleScreenInteractor.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation

class TitleScreenInteractor: TitleScreenInteractorInterface {
    var api = ApiManager()
    
    func requestDownloadData() {
        api.fetchData()
    }
}
