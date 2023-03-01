//
//  ViewController.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 18/02/23.
//

import UIKit
import Lottie
import AVFoundation

final class TitleScreenViewController: UIViewController {
    private let layoutView = LayoutTitleScreen()
    private let downloadingView = DownloadingView()
    private var presenterInterface: TitleScreenPresenterInterface
    private var touchScreenSound: AVAudioPlayer?
    
    init(presenterInterface: TitleScreenPresenterInterface) {
        self.presenterInterface = presenterInterface
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configData()
        configUI()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func configData() {
        presenterInterface.loadDataBase()
        presenterInterface.viewModel = self
        presenterInterface.fetchSounds()
    }
    
    private func configUI() {
        view.backgroundColor = .white
        addComponents()
        setConstraint()
        configureComponents()
        registerTapGesture()
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
    
    private func registerTapGesture() {
        presenterInterface.registerTapGesture()
    }
    
    @objc private func downloadAlert(_ sender: UITapGestureRecognizer) {
        let alert = showAlert(title: Constants.TitleScreenStrings.downloadAlertTitle,
                                   message: Constants.TitleScreenStrings.downloadAlertMessage,
                                   preferredStyle: .alert,
                                   actionTitle: Constants.TitleScreenStrings.titleActionCancel,
                                   actionStyle: .destructive)
        alert.addAction(UIAlertAction(title: Constants.TitleScreenStrings.titleActionDefault, style: .default) {
            _ in
            self.downloadingView.startDownload()
            self.downloadingView.isHidden = false
            self.presenterInterface.deleteDataBase()
            self.presenterInterface.fetchData()
        })
        self.present(alert, animated: true)
    }
    
    @objc private func navigateToSelectCharacter(_ sender: UITapGestureRecognizer) {
        touchScreenSound?.play()
        presenterInterface.goToSelectCharacter()
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
    func registerTapGestureDownloadAlert() {
        let touch = UITapGestureRecognizer(target: self, action: #selector(downloadAlert(_:)))
        view.addGestureRecognizer(touch)
    }
    
    func registerTapGestureNavigation() {
        let touch = UITapGestureRecognizer(target: self, action: #selector(navigateToSelectCharacter(_:)))
        view.addGestureRecognizer(touch)
    }
    
    func showSuccess() {
        registerTapGesture()
        downloadingView.stopDownload()
        self.present(showAlert(title: Constants.TitleScreenStrings.alertSuccessTitle,
                               message: Constants.TitleScreenStrings.alertSuccessMessage,
                               preferredStyle: .alert,
                               actionTitle: Constants.TitleScreenStrings.alertSuccessActionTitle,
                               actionStyle: .default),
                     animated: true)
    }
    
    func fetchSoundsSuccess(file: AVAudioPlayer) {
        touchScreenSound = file
    }
    
    func showError() {
        downloadingView.stopDownload()
        self.present(showAlert(title: Constants.TitleScreenStrings.alertErrorTitle,
                               message: Constants.TitleScreenStrings.alertErrorMessage,
                               preferredStyle: .alert,
                               actionTitle: Constants.TitleScreenStrings.alertErrorActionTitle,
                               actionStyle: .default),
                     animated: true)
    }
    
    func audioNotFound() {
        self.present(showAlert(title: Constants.TitleScreenStrings.audioNotFoundTitle,
                               message: Constants.TitleScreenStrings.audioNotFoundMessage,
                               preferredStyle: .alert,
                               actionTitle: Constants.TitleScreenStrings.audioNotFoundActionTitle,
                               actionStyle: .default),
                     animated: true)
    }
}
