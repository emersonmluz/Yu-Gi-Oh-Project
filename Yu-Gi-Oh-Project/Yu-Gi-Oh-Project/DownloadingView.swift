//
//  DownloadingView.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 23/02/23.
//

import UIKit
import Lottie

class DownloadingView: UIView {
    
    private lazy var downloadingAnimation: LottieAnimationView = {
        var animation = LottieAnimationView()
        animation = .init(name: Constants.AnimationName.downloadingAnimation)
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop
        animation.animationSpeed = 0.8
        animation.play()
        animation.translatesAutoresizingMaskIntoConstraints = false
        return animation
    }()
    
    private lazy var downloadingLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.TitleScreenStrings.downloadingText
        label.font = UIFont(name: Constants.FontName.arial, size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        addComponents()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configView() {
        self.backgroundColor = .white
        self.isHidden = true
    }
    
    internal func addComponents() {
        self.addSubview(downloadingAnimation)
        self.addSubview(downloadingLabel)
    }
    
    internal func setConstraint() {
        NSLayoutConstraint.activate([
            downloadingAnimation.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            downloadingAnimation.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            downloadingAnimation.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            downloadingAnimation.heightAnchor.constraint(equalToConstant: 150),
            
            downloadingLabel.topAnchor.constraint(equalTo: downloadingAnimation.bottomAnchor, constant: 20),
            downloadingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            downloadingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
