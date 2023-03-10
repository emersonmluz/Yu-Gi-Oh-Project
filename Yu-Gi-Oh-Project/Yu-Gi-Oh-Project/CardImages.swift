//
//  CardImageList.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 22/02/23.
//

import Foundation

struct CardImages: Decodable {
    internal var id: Int
    internal var imageUrl: String
    internal var imageUrlSmall: String
    internal var imageUrlCropped: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "image_url"
        case imageUrlSmall = "image_url_small"
        case imageUrlCropped = "image_url_cropped"
    }
}
