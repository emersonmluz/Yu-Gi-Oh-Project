//
//  DataBaseManager.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 23/02/23.
//

import UIKit
import CoreData

class DataBaseManager {
    func loadData(completion: @escaping((NSError?) -> Void)) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Constants.CoreData.entityName)
        do {
            cardBase = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            completion(error)
        }
    }
    
    func save(cardModel: CardModel, completion: @escaping((NSError?) -> Void)) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Constants.CoreData.entityName, in: managedContext)!
        let card = NSManagedObject(entity: entity, insertInto: managedContext)
        card.setValue(cardModel.id, forKey: Constants.CoreData.fieldsName.id)
        card.setValue(cardModel.name, forKey: Constants.CoreData.fieldsName.name)
        card.setValue(cardModel.type, forKey: Constants.CoreData.fieldsName.type)
        card.setValue(cardModel.frameType, forKey: Constants.CoreData.fieldsName.frameType)
        card.setValue(cardModel.description, forKey: Constants.CoreData.fieldsName.desc)
        card.setValue(cardModel.atk, forKey: Constants.CoreData.fieldsName.atk)
        card.setValue(cardModel.def, forKey: Constants.CoreData.fieldsName.def)
        card.setValue(cardModel.level, forKey: Constants.CoreData.fieldsName.level)
        card.setValue(cardModel.style, forKey: Constants.CoreData.fieldsName.style)
        card.setValue(cardModel.attribute, forKey: Constants.CoreData.fieldsName.attribute)
        card.setValue(cardModel.images.first?.imageUrl, forKey: Constants.CoreData.fieldsName.image)
        do {
            try managedContext.save()
            cardBase.append(card)
        } catch let error as NSError {
            completion(error)
        }
    }
    
    func deleteData(completion: @escaping((NSError?) -> Void)) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            managedContext.deletedObjects
            cardBase.removeAll()
            try managedContext.save()
        } catch let error as NSError {
            completion(error)
        }
    }
}

