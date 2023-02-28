//
//  SelectCharacterCordinator.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 27/02/23.
//

import UIKit

final class SelectCharacterCoordinator: SelectCharacterCoordinatorInterface {
    internal var navigator: UINavigationController?
    
    init(navigator: UINavigationController? = nil) {
        self.navigator = navigator
    }
    
    internal func start() {
        //let presenter = SelectCharacterPresenter()
        let viewController = SelectCharacterViewController()
        
        navigator?.setNavigationBarHidden(true, animated: false)
        navigator?.pushViewController(viewController, animated: true)
    }
}
