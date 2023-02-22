//
//  Constants.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 18/02/23.
//

import Foundation

class Constants {
    struct FontName {
        static let arial = "Arial"
        static let impact = "Impact"
    }
    
    struct AnimationName {
        static let TitleScreenBackground = "TitleScreenBackground"
    }
    
    struct ImageName {
        static let yuGiOhTitle = "Yu-Gi-Oh-Title"
        static let launchScreen = "LaunchScreen"
    }
    
    struct SystemImageName {
        static let arrowShapeLeftFill = "arrowshape.left.fill"
    }
    
    struct TitleScreenStrings {
        static let touchLabelText = "Toque na tela para continuar"
        static let subtitleLabelText = "É hora do duelo!"
        static let downloadAlertTitle = "Atenção!"
        static let downloadAlertMessage = "É necessário baixar os dados do jogo, certifique-se de que está usando wi-fi."
        static let titleActionCancel = "Cancelar"
        static let titleActionDefault = "Baixar"
        static let alertErrorTitle = "Ops!"
        static let alertErrorMessage = "Algo deu errado, tente novamente mais tarde."
        static let alertErrorActionTitle = "Entendi"
    }
    
    struct NetWorking {
        static let urlCardList = "https://db.ygoprodeck.com/api/v7/cardinfo.php?format=Speed%20Duel"
    }
}
