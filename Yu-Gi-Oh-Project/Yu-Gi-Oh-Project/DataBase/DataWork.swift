//
//  DataWork.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 24/02/23.
//

import Foundation
import UIKit

class DataWork: TitleScreenInteractorWork {
    internal func saveData(data: CardList?) {
        guard let cardList = data?.data else {return}
        for card in cardList {
            var cardModel = card
            let cardImage = UIImageView()
            cardImage.loadFrom(URLAddress: card.images[0].imageUrl)
            DispatchQueue.main.async {
                cardModel.images[0].imageUrl = cardImage.image?.base64 ?? ""
                dataBase.save(cardModel: cardModel)
            }
        }
    }
    
    internal func deleteData() {
        dataBase.deleteData()
    }
}
