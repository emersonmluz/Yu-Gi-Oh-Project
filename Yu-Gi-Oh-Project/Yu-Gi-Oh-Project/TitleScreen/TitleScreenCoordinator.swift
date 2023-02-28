//
//  TitleScreenCordinator.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 27/02/23.
//

import UIKit

final class TitleScreenCoordinator: TitleScreenCoordinatorInterface {
    internal var navigator: UINavigationController?
    
    init(navigator: UINavigationController? = nil) {
        self.navigator = navigator
    }
    
    func start() {
        let presenter = TitleScreenPresenter(cordinator: self, interactorInterface: TitleScreenInteractor())
        let viewController = TitleScreenViewController(presenterInterface: presenter)
        
        navigator?.setNavigationBarHidden(true, animated: false)
        navigator?.pushViewController(viewController, animated: true)
    }
    
    func goToSelectCharacter() {
        Router.shared.showSelectCharacter(navigator: navigator ?? UINavigationController())
    }
}
