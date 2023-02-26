//
//  DataWork.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 24/02/23.
//

import Foundation
import UIKit

class DataWork: TitleScreenInteractorWork {
    internal func saveData(data: CardModel) {
        dataBase.save(cardModel: data)
    }
    
    internal func loadData() {
        dataBase.loadData()
    }
    
    internal func deleteData() {
        dataBase.deleteData()
    }
}
