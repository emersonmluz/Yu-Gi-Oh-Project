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
    func fetchData()
}

protocol TitleScreenInteractorInterface {
    var api: ApiManager { get }
    func requestDownloadData()
}
