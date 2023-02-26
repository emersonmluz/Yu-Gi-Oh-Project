//
//  TitleScreenPresenter.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation

class TitleScreenPresenter: TitleScreenPresenterInterface {
    var interactorInterface: TitleScreenInteractorInterface
    weak var viewModel: TitleScreenViewModel?
    
    init(interactorInterface: TitleScreenInteractorInterface, viewModel: TitleScreenViewModel? = nil) {
        self.interactorInterface = interactorInterface
        self.viewModel = viewModel
        self.interactorInterface.apiOutput = self
    }
    
    internal func registerTapGesture() {
        if cardBase.count < 908 {
            viewModel?.registerTapGestureDownloadAlert()
        } else {
            viewModel?.registerTapGestureNavigation()
        }
    }
    
    internal func fetchData() {
        interactorInterface.requestDownloadData()
    }
    
    internal func deleteDataBase() {
        interactorInterface.deleteDataBase()
    }
}

extension TitleScreenPresenter: TitleScreenInteractorOutput {
    func fetchFinished(output: CardList?, error: NSError?) {
        if output != nil {
            viewModel?.showSuccess()
        } else {
            guard error != nil else {return}
            viewModel?.showError()
        }
    }
}
