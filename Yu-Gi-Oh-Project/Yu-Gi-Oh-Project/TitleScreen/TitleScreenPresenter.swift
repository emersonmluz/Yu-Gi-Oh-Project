//
//  TitleScreenPresenter.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation

class TitleScreenPresenter: TitleScreenPresenterInterface {
    var interactorInterface: TitleScreenInteractorInterface?
    var interactorController = TitleScreenInteractor()
    
    func fetchData() {
        interactorInterface?.requestDownloadData()
    }
}
