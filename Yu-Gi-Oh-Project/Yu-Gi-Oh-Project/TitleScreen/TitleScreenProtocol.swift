//
//  TitleScreenProtocol.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import UIKit

protocol TitleScreenPresenterInterface {
    var interactorInterface: TitleScreenInteractorInterface { get }
    var viewModel: TitleScreenViewModel? { get set }
    func loadDataBase()
    func deleteDataBase()
    func registerTapGesture()
    func fetchData()
}

protocol TitleScreenInteractorInterface {
    var api: ApiManager { get }
    var output: TitleScreenInteractorOutput? { get set }
    var workData: TitleScreenInteractorWorkData { get }
    var workInternet: TitleScreenInteractorWorkInternet { get }
    func saveDataBase(data: CardModel)
    func loadDataBase()
    func deleteDataBase()
    func requestDownloadData()
    func downloadImage(card: CardModel, completion: @escaping((UIImage) -> Void))
}

protocol TitleScreenInteractorOutput: AnyObject {
    func fetchDataFinished(output: CardList?, error: NSError?)
}

protocol TitleScreenInteractorWorkData {
    func saveData(data: CardModel)
    func loadData()
    func deleteData()
}

protocol TitleScreenInteractorWorkInternet {
    func downloadImage(card: CardModel, completion: @escaping((_ image: UIImage) -> Void))
}

protocol TitleScreenViewModel: AnyObject {
    func registerTapGestureDownloadAlert()
    func registerTapGestureNavigation()
    func showSuccess()
    func showError()
}
