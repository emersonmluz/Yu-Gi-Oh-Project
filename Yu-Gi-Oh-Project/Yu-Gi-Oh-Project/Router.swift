//
//  Router.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 27/02/23.
//

import UIKit

protocol RouterProtocol {
    func showTitleScreen(navigator: UINavigationController)
    func showSelectCharacter(navigator: UINavigationController)
}

final class Router: RouterProtocol {
    init() { }

    internal static var shared = Router()
    internal var navigator: UINavigationController?

    internal func showTitleScreen(navigator: UINavigationController) {
        let coordinator = TitleScreenCoordinator(navigator: navigator)
        coordinator.start()
    }
    
    internal func showSelectCharacter(navigator: UINavigationController) {
        let coordinator = SelectCharacterCoordinator(navigator: navigator)
        coordinator.start()
    }
}
