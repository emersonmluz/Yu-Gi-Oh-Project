//
//  TitleScreenPresenter.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation

class TitleScreenPresenter: TitleScreenPresenterInterface {
    var interactorInterface: TitleScreenInteractorInterface?
    let interactorController = TitleScreenInteractor()
    
    internal func fetchData() {
        interactorInterface?.requestDownloadData()
    }
}
