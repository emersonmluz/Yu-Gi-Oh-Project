//
//  DataWork.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 24/02/23.
//

import Foundation
import UIKit

class WorkData: TitleScreenInteractorWorkData {
    weak var workError: TitleScreenWorkDataError?
    
    init(workError: TitleScreenWorkDataError? = nil) {
        self.workError = workError
    }
    
    internal func saveData(data: CardModel) {
        dataBase.save(cardModel: data) { error in
            if error != nil {
                self.workError?.workError()
            }
        }
    }
    
    internal func loadData() {
        dataBase.loadData() { error in
            if error != nil {
                self.workError?.workError()
            }
        }
    }
    
    internal func deleteData() {
        dataBase.deleteData() { error in
            if error != nil {
                self.workError?.workError()
            }
        }
    }
}
