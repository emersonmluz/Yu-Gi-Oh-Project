//
//  TitleScreenProtocol.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation

protocol TitleScreenPresenterInterface {
    var interactorInterface: TitleScreenInteractorInterface { get }
    var viewModel: TitleScreenViewModel? { get set }
    func deleteDataBase()
    func registerTapGesture()
    func fetchData()
}

protocol TitleScreenInteractorInterface {
    var apiInput: ApiManager { get }
    var apiOutput: TitleScreenInteractorOutput? { get set }
    var dataWork: TitleScreenInteractorWork { get }
    func deleteDataBase()
    func requestDownloadData()
}

protocol TitleScreenInteractorOutput: AnyObject {
    func fetchFinished(output: CardList?, error: NSError?)
}

protocol TitleScreenInteractorWork {
    func saveData(data: CardList?)
    func deleteData()
}

protocol TitleScreenViewModel: AnyObject {
    func registerTapGestureDownloadAlert()
    func registerTapGestureNavigation()
    func showSuccess()
    func showError()
}
