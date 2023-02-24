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
    var apiInput: ApiManager { get }
    var apiOutput: TitleScreenInteractorOutput? { get }
    var dataWork: TitleScreenInteractorWork? { get }
    var dataWorkController: DataWork { get }
    func requestDownloadData()
}

protocol TitleScreenInteractorOutput: AnyObject {
    func fetchFinished(output: CardList?, error: NSError?)
}

protocol TitleScreenInteractorWork {
    func dataBaseWork(data: CardList?)
}

protocol TitleScreenViewModel: AnyObject {
    func showSuccess()
    func showError()
}
