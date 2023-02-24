//
//  DataWork.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 24/02/23.
//

import Foundation

class DataWork: TitleScreenInteractorWork {
    func dataBaseWork(data: CardList?) {
        guard let cardList = data?.data else {return}
        for card in cardList {
            dataBase.save(cardModel: card)
        }
    }
}
