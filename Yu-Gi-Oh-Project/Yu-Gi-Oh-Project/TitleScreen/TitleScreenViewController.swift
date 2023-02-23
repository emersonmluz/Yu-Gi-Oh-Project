//
//  ViewController.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 18/02/23.
//

import UIKit
import Lottie

class TitleScreenViewController: UIViewController {
    
    private lazy var background: LottieAnimationView = {
        var animation = LottieAnimationView()
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation = .init(name: Constants.AnimationName.titleScreenBackground)
        animation.contentMode = .scaleToFill
        animation.loopMode = .loop
        animation.animationSpeed = 0.5
        animation.play()
        return animation
    }()
    
    private lazy var titleImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Constants.ImageName.yuGiOhTitle)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.TitleScreenStrings.subtitleLabelText
        label.font = UIFont(name: Constants.FontName.impact, size: 40)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.shadowOffset = CGSize(width: 3, height: 3)
        label.shadowColor = .link
        return label
    }()
    
    private lazy var touchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.TitleScreenStrings.touchLabelText
        label.font = UIFont(name: Constants.FontName.arial, size: 25)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.alpha = 0.8
        return label
    }()
    
    private lazy var downloadingView: DownloadingView = {
        let view = DownloadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var presenterInterface: TitleScreenPresenterInterface?
    private let presenterController = TitleScreenPresenter()
    private var isDownloaded: Bool = false
    private var cardList: [CardModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func configUI() {
        view.backgroundColor = .white
        assignDelegate()
        addComponents()
        configureComponents()
        setConstraint()
        registerTapGesture()
    }
    
    private func assignDelegate() {
        presenterInterface = presenterController
        presenterController.interactorInterface = presenterController.interactorController
        presenterController.interactorController.apiOutput = presenterController
        presenterController.viewModel = self
    }
    
    private func addComponents() {
        view.addSubview(background)
        view.addSubview(titleImageView)
        view.addSubview(subtitleLabel)
        view.addSubview(touchLabel)
        view.addSubview(downloadingView)
    }
    
    private func configureComponents() {
        background.frame = view.frame
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            titleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            titleImageView.heightAnchor.constraint(equalToConstant: 250),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleImageView.centerYAnchor, constant: 30),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            touchLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            touchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            touchLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            
            downloadingView.topAnchor.constraint(equalTo: view.topAnchor),
            downloadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            downloadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            downloadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func addTapGesture() {
        if isDownloaded == false {
            let touch = UITapGestureRecognizer(target: self, action: #selector(downloadAlert(_:)))
            view.addGestureRecognizer(touch)
        } else {
            let touch = UITapGestureRecognizer(target: self, action: #selector(navigateToHomePage(_:)))
            view.addGestureRecognizer(touch)
        }
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
    
    private func registerTapGesture() {
        addTapGesture()
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
        isDownloaded = true
        registerTapGesture()
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
