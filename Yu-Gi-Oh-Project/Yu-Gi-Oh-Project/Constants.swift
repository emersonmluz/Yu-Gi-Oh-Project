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
    
    struct TextMessage {
        struct TitleMessage {
            static let subtitleGame = "É hora do duelo!"
            static let atention = "Atenção!"
            static let ops = "Ops!"
            static let ready = "Tudo pronto!"
            static let erro = "Erro!"
        }
        
        struct ComponentMessage {
            static let download = "Baixar"
            static let cancel = "Cancelar"
            static let understood = "Entendi"
            static let continueMessage = "Continuar"
        }
        
        struct SuccessMessage {
            static let downloadFinished = "Download fnalizado com sucesso."
        }
        
        struct FailedMessage {
            static let somethingErro = "Algo deu errado, tente novamente mais tarde."
            static let audioNotFound = "Um ou mais arquivos de áudio não foram encontrados."
        }
        
        struct InfoMessage {
            static let touchScreenMessage = "Toque na tela para continuar"
            static let downloadIsNecessary = "É necessário baixar os dados do jogo, certifique-se de que está usando wi-fi."
            static let downloadingData = "Baixando arquivos... aguarde! \nIsso pode demorar alguns minutos."
        }
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
    
    struct Sounds {
        struct Names {
            static let touchScreen = "TouchScreen"
            static let backgroundMusic = "BackgroundMusic"
        }
        
        struct Format {
            static let mp3 = "mp3"
        }
    }
}
