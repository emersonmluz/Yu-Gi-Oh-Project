//
//  TitleScreenPresenter.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation
import UIKit

final class TitleScreenPresenter: TitleScreenPresenterInterface {
    internal var cordinator: TitleScreenCoordinatorInterface?
    internal var interactorInterface: TitleScreenInteractorInterface
    internal weak var viewModel: TitleScreenViewModel?
    
    init(cordinator: TitleScreenCoordinatorInterface? = nil, interactorInterface: TitleScreenInteractorInterface) {
        self.cordinator = cordinator
        self.interactorInterface = interactorInterface
        self.interactorInterface.output = self
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
    
    internal func loadDataBase() {
        interactorInterface.loadDataBase()
    }
    
    internal func deleteDataBase() {
        interactorInterface.deleteDataBase()
    }
    
    internal func goToSelectCharacter() {
        cordinator?.goToSelectCharacter()
    }
}

extension TitleScreenPresenter: TitleScreenInteractorOutput {
    internal func fetchDataFinished(output: CardList?, error: NSError?) {
        if output != nil {
            guard let cardList = output?.data else {return}
            for card in cardList {
                interactorInterface.downloadImage(card: card) { [weak self] image in
                    var cardModel = card
                    cardModel.images[0].imageUrl = image.base64 ?? ""
                    self?.interactorInterface.saveDataBase(data: cardModel)
                }
            }
            DispatchQueue.main.async {
                self.viewModel?.showSuccess()
            }
        } else {
            guard error != nil else {return}
            viewModel?.showError()
        }
    }
    
    internal func dataError() {
        viewModel?.showError()
    }
}
