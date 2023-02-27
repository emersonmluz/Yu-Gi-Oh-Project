//
//  CardModel.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 22/02/23.
//

import UIKit

struct CardModel: Decodable {
    internal var id: Int
    internal var name: String
    internal var type: String
    internal var frameType: String
    internal var description: String
    internal var atk: Int?
    internal var def: Int?
    internal var level: Int?
    internal var style: String
    internal var attribute: String?
    internal var images: [CardImages]
    
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
