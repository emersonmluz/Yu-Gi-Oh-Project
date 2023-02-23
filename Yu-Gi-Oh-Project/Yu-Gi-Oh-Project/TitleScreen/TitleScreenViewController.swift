//
//  ViewController.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 18/02/23.
//

import UIKit
import Lottie

class TitleScreenViewController: UIViewController {
    
    private let layoutView = LayoutTitleScreen()
    private let downloadingView = DownloadingView()
    private var presenterInterface: TitleScreenPresenterInterface?
    private let presenterController = TitleScreenPresenter()
    private var isDownloaded: Bool = false {didSet {registerTapGestureNavigation()}}
    private var cardList: [CardModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        dataBase.loadData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func configUI() {
        view.backgroundColor = .white
        assignDelegate()
        addComponents()
        setConstraint()
        configureComponents()
        registerTapGestureDownloadAlert()
    }
    
    private func assignDelegate() {
        presenterInterface = presenterController
        presenterController.interactorInterface = presenterController.interactorController
        presenterController.interactorController.apiOutput = presenterController
        presenterController.viewModel = self
    }
    
    private func addComponents() {
        view.addSubview(layoutView)
        view.addSubview(downloadingView)
    }
    
    private func configureComponents() {
        layoutView.background.frame = view.frame
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            layoutView.topAnchor.constraint(equalTo: view.topAnchor),
            layoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            layoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            layoutView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            downloadingView.topAnchor.constraint(equalTo: view.topAnchor),
            downloadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            downloadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            downloadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func registerTapGestureDownloadAlert() {
        let touch = UITapGestureRecognizer(target: self, action: #selector(downloadAlert(_:)))
        view.addGestureRecognizer(touch)
    }
    
    private func registerTapGestureNavigation() {
        let touch = UITapGestureRecognizer(target: self, action: #selector(navigateToHomePage(_:)))
        view.addGestureRecognizer(touch)
    }
    
    @objc private func downloadAlert(_ sender: UITapGestureRecognizer) {
        let alert = showAlert(title: Constants.TitleScreenStrings.downloadAlertTitle,
                                   message: Constants.TitleScreenStrings.downloadAlertMessage,
                                   preferredStyle: .alert,
                                   actionTitle: Constants.TitleScreenStrings.titleActionCancel,
                                   actionStyle: .destructive)
        alert.addAction(UIAlertAction(title: Constants.TitleScreenStrings.titleActionDefault, style: .default) {
            _ in
            self.downloadingView.isHidden = false
            self.presenterInterface?.fetchData()
        })
        self.present(alert, animated: true)
    }
    
    @objc private func navigateToHomePage(_ sender: UITapGestureRecognizer) {
        print("para próxima tela")
    }
    
    private func showAlert(title: String, message: String, preferredStyle: UIAlertController.Style, actionTitle: String, actionStyle: UIAlertAction.Style) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alert.view.backgroundColor = UIColor.white
        alert.view.layer.cornerRadius = 10
        alert.view.layer.borderWidth = 3
        alert.view.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        alert.addAction(UIAlertAction(title: actionTitle, style: actionStyle))
        return alert
    }
}

extension TitleScreenViewController: TitleScreenViewModel {
    func extractData(data: [CardModel]) {
        cardList = data
        for card in cardList! {
            dataBase.save(cardModel: card)
        }
        isDownloaded = true
        downloadingView.isHidden = true
        let alert = showAlert(title: Constants.TitleScreenStrings.alertSuccessTitle,
                 message: Constants.TitleScreenStrings.alertSuccessMessage,
                 preferredStyle: .alert,
                 actionTitle: Constants.TitleScreenStrings.alertSuccessActionTitle,
                 actionStyle: .default)
        self.present(alert, animated: true)
    }
    
    func showError(error: NSError) {
        downloadingView.isHidden = true
        let alert = showAlert(title: Constants.TitleScreenStrings.alertErrorTitle,
                 message: Constants.TitleScreenStrings.alertErrorMessage,
                 preferredStyle: .alert,
                 actionTitle: Constants.TitleScreenStrings.alertErrorActionTitle,
                 actionStyle: .default)
        self.present(alert, animated: true)
    }
}
