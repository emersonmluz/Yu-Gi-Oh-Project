//
//  DataBaseManager.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 23/02/23.
//

import UIKit
import CoreData

class DataBaseManager {
    func loadData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CardBase")
        do {
            cardBase = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print(error)
        }
    }
    
    func save(cardModel: CardModel) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CardBase", in: managedContext)!
        let card = NSManagedObject(entity: entity, insertInto: managedContext)
        card.setValue(cardModel.id, forKey: "id")
        card.setValue(cardModel.name, forKey: "name")
        card.setValue(cardModel.type, forKey: "type")
        card.setValue(cardModel.frameType, forKey: "frameType")
        card.setValue(cardModel.description, forKey: "desc")
        card.setValue(cardModel.atk, forKey: "atk")
        card.setValue(cardModel.def, forKey: "def")
        card.setValue(cardModel.level, forKey: "level")
        card.setValue(cardModel.style, forKey: "style")
        card.setValue(cardModel.attribute, forKey: "attribute")
        card.setValue(cardModel.images.first?.imageUrl, forKey: "image")
        do {
            try managedContext.save()
            cardBase.append(card)
        } catch let error as NSError {
            print(error)
        }
    }
    
    func delete(_ row: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            managedContext.delete(cardBase[row])
            cardBase.remove(at: row)
            try managedContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
}

