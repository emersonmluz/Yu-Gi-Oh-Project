//
//  CardModel.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 22/02/23.
//

import UIKit

struct CardModel: Decodable {
    var id: Int
    var name: String
    var type: String
    var frameType: String
    var description: String
    var atk: Int?
    var def: Int?
    var level: Int?
    var style: String
    var attribute: String?
    var images: [CardImages]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case frameType
        case description = "desc"
        case atk
        case def
        case level
        case style = "race"
        case attribute
        case images = "card_images"
    }
}
