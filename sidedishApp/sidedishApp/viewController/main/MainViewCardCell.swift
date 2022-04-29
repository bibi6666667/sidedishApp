//
//  MainViewCardCell.swift
//  sidedishApp
//
//  Created by Bibi on 2022/04/19.
//

import Foundation
import UIKit

class MainViewCardCell: UICollectionViewCell {
    
    static let identifier = "MainViewCardCell"
    
    private let cardImageView: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .systemGray5
        image.layer.cornerRadius = 5
        return image
    }()
    
    private let mainViewCardInfo: MainViewCardInfo = {
        var stackView = MainViewCardInfo()
        stackView.axis = .vertical
        stackView.alignment = .leading
        //stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setUIConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setUIConstraints()
    }
    
    func setPropertiesValue(dish: MainCard.Body) {
        self.mainViewCardInfo.setPropertiesValue(dish: dish)
    }
    
    func setImage(imageData: Data) {
        DispatchQueue.main.async {
            self.cardImageView.image = UIImage(data: imageData)
        }
    }
    
    private func setUI() {
        self.addSubview(cardImageView)
        self.addSubview(mainViewCardInfo)
    }
    
    private func setUIConstraints() {
        congifureCardImageViewConstraint()
        configureCardInfoVerticalStackViewConstraint()
    }
    
    private func congifureCardImageViewConstraint() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            cardImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            cardImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            cardImageView.widthAnchor.constraint(equalToConstant: 120),
            cardImageView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    private func configureCardInfoVerticalStackViewConstraint() {
        mainViewCardInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainViewCardInfo.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            mainViewCardInfo.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            mainViewCardInfo.leadingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: 5),
            mainViewCardInfo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            mainViewCardInfo.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
}
