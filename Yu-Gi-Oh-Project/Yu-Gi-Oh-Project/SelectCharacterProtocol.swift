//
//  SelectCharacterProtocol.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 27/02/23.
//

import UIKit

protocol SelectCharacterCoordinatorInterface: AnyObject {
    var navigator: UINavigationController? { get set }
    func start()
}
