//
//  LayoutTitleScreen.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 23/02/23.
//

import Lottie
import UIKit

final class LayoutTitleScreen: UIView {
    internal lazy var background: LottieAnimationView = {
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
        label.text = Constants.TextMessage.TitleMessage.subtitleGame
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
        label.text = Constants.TextMessage.InfoMessage.touchScreenMessage
        label.font = UIFont(name: Constants.FontName.arial, size: 25)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.alpha = 0.8
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        setComponents()
        setConstraint()
    }
    
    private func setComponents() {
        self.addSubview(background)
        self.addSubview(titleImageView)
        self.addSubview(subtitleLabel)
        self.addSubview(touchLabel)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            titleImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35),
            titleImageView.heightAnchor.constraint(equalToConstant: 250),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleImageView.centerYAnchor, constant: 30),
            subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            touchLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            touchLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            touchLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
        ])
    }
}
