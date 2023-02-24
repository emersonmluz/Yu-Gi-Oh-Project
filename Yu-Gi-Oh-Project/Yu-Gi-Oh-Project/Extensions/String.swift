//
//  String.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 24/02/23.
//

import UIKit

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}
