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
        animation = .init(name: Constants.AnimationName.TitleScreenBackground)
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
    
    private var presenterInterface: TitleScreenPresenterInterface?
    private let presenterController = TitleScreenPresenter()
    private var isDownloaded: Bool = false
    
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
        configureConstraint()
        registerTapGesture()
    }
    
    private func assignDelegate() {
        presenterInterface = presenterController
        presenterController.interactorInterface = presenterController.interactorController
    }
    
    private func addComponents() {
        view.addSubview(background)
        view.addSubview(titleImageView)
        view.addSubview(subtitleLabel)
        view.addSubview(touchLabel)
    }
    
    private func configureComponents() {
        background.frame = view.frame
    }
    
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            titleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            titleImageView.heightAnchor.constraint(equalToConstant: 250),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleImageView.centerYAnchor, constant: 30),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            touchLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            touchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            touchLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80)
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
        let alert = UIAlertController(title: Constants.TitleScreenStrings.downloadAlertTitle, message: Constants.TitleScreenStrings.downloadAlertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.TitleScreenStrings.titleActionCancel, style: .cancel))
        alert.addAction(UIAlertAction(title: Constants.TitleScreenStrings.titleActionDefault, style: .default) {
            _ in
            self.presenterInterface?.fetchData()
            self.isDownloaded = true
            self.registerTapGesture()
        })
        self.present(alert, animated: true)
    }
    
    @objc private func navigateToHomePage(_ sender: UITapGestureRecognizer) {
        print("para próxima tela")
    }
    
    private func registerTapGesture() {
        addTapGesture()
    }
}

