//
//  DownloadingView.swift
//  Yu-Gi-Oh-Project
//
//  Created by Émerson M Luz on 23/02/23.
//

import UIKit
import Lottie

class DownloadingView: UIView {
    
    private lazy var animation: LottieAnimationView = {
        var animation = LottieAnimationView()
        animation = .init(name: Constants.AnimationName.downloadingAnimation)
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop
        animation.animationSpeed = 0.8
        animation.translatesAutoresizingMaskIntoConstraints = false
        return animation
    }()
    
    private lazy var infoLabel: UILabel = {
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
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.isHidden = true
    }
    
    internal func addComponents() {
        self.addSubview(animation)
        self.addSubview(infoLabel)
    }
    
    internal func setConstraint() {
        NSLayoutConstraint.activate([
            animation.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            animation.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            animation.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            animation.heightAnchor.constraint(equalToConstant: 150),
            
            infoLabel.topAnchor.constraint(equalTo: animation.bottomAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    internal func startDownload() {
        self.isHidden = false
        animation.play()
    }
    
    internal func stopDownload() {
        self.isHidden = true
        animation.stop()
    }
}
