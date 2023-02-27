//
//  WorkInternet.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 25/02/23.
//

import UIKit

final class WorkInternet: TitleScreenInteractorWorkInternet {
    func downloadImage(card: CardModel, completion: @escaping ((UIImage) -> Void)) {
        let cardImage = UIImageView()
        cardImage.loadFrom(URLAddress: card.images[0].imageUrl)
        DispatchQueue.main.async {
            if let img = cardImage.image {
                completion(img)
            }
        }
    }
}
