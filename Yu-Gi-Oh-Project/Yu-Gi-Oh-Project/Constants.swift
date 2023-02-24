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
        static let titleScreenBackground = "TitleScreenBackground"
        static let downloadingAnimation = "DownloadingAnimation"
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
        static let downloadingText = "Baixando arquivos... aguarde! \nIsso pode demorar alguns minutos."
        static let alertSuccessTitle = "Tudo pronto!"
        static let alertSuccessMessage = "Download fnalizado com sucesso."
        static let alertSuccessActionTitle = "Continuar"
    }
    
    struct NetWorking {
        static let urlCardList = "https://db.ygoprodeck.com/api/v7/cardinfo.php?format=Speed%20Duel"
    }
    
    struct CoreData {
        static let entityName = "CardBase"
        
        struct fieldsName {
            static let id = "id"
            static let name = "name"
            static let type = "type"
            static let frameType = "frameType"
            static let desc = "desc"
            static let atk = "atk"
            static let def = "def"
            static let level = "level"
            static let style = "style"
            static let attribute = "attribute"
            static let image = "image"
        }
    }
}
