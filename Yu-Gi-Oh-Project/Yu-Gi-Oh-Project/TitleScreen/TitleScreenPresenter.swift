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
    weak var viewModel: TitleScreenViewModel?
    
    internal func fetchData() {
        interactorInterface?.requestDownloadData()
    }
}

extension TitleScreenPresenter: TitleScreenInteractorOutput {
    func fetchFinished(output: CardList?, error: NSError?) {
        if output != nil {
            viewModel?.extractData(data: output?.data ?? [])
        } else {
            guard let error = error else {return}
            viewModel?.showError(error: error)
        }
    }
}
