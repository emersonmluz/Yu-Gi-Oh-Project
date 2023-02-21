//
//  TitleScreenProtocol.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 21/02/23.
//

import Foundation

protocol TitleScreenPresenterInterface {
    func fetchData()
}

protocol TitleScreenInteractorInterface {
    func requestDownloadData()
}
