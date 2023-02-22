//
//  TitleScreenProtocol.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation

protocol TitleScreenPresenterInterface {
    var interactorInterface: TitleScreenInteractorInterface? { get }
    var interactorController: TitleScreenInteractor { get }
    var viewModel: TitleScreenViewModel? { get }
    func fetchData()
}

protocol TitleScreenInteractorInterface {
    var api: ApiManager { get }
    var apiOutput: TitleScreenInteractorOutput? { get }
    func requestDownloadData()
}

protocol TitleScreenInteractorOutput: AnyObject {
    func fetchFinished(output: CardList?, error: NSError?)
}

protocol TitleScreenViewModel: AnyObject {
    func extractData(data: [CardModel])
    func showError(error: NSError)
}
