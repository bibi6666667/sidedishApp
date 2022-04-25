//
//  DetailTextViewController.swift
//  sidedishApp
//
//  Created by juntaek.oh on 2022/04/19.
//

import UIKit

class MainDescriptionViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.customColor(.black)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 32)
        label.baselineAdjustment = .alignCenters
        label.text = "오리 주물럭_반조리"
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.customColor(.grey2)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        label.baselineAdjustment = .alignCenters
        label.text = "감칠맛 나는 매콤한 양념"
        return label
    }()
    
    private lazy var salePrice: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.customColor(.grey1)
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 18)
        label.baselineAdjustment = .alignCenters
        label.text = "12,640원"
        return label
    }()
    
    private lazy var rawPrice: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.customColor(.grey2)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var eventLabel: UILabel = {
        var label = UILabel()
        label.clipsToBounds = true
        label.backgroundColor = UIColor.customColor(.primaryDark)
        label.layer.cornerRadius = 10
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        label.text = "런칭특가"
        return label
    }()
    
    private lazy var sectionBottom: UILabel = {
        var label = UILabel()
        label.layer.backgroundColor = UIColor.customColor(.grey3).cgColor
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAllProperties()
    }
}

private extension MainDescriptionViewController {
    func setAllProperties() {
        configureTitle()
        configureSubLabel()
        configureSalePrice()
        configureRawPrice()
        configureEventLabel()
        configureSectionBottom()
    }
    
    func configureTitle() {
        self.view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func configureSubLabel() {
        self.view.addSubview(subtitleLabel)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            subtitleLabel.widthAnchor.constraint(equalToConstant: 177),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func configureSalePrice() {
        self.view.addSubview(salePrice)
        
        salePrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            salePrice.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 8),
            salePrice.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            salePrice.widthAnchor.constraint(equalToConstant: 74),
            salePrice.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func configureRawPrice() {
        setRawPriceAttribute(label: rawPrice, text: "15,800원")
        self.view.addSubview(rawPrice)
        
        rawPrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rawPrice.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 8),
            rawPrice.leadingAnchor.constraint(equalTo: self.salePrice.trailingAnchor, constant: 8),
            rawPrice.widthAnchor.constraint(equalToConstant: 64),
            rawPrice.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func configureEventLabel() {
        self.view.addSubview(eventLabel)
        
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventLabel.topAnchor.constraint(equalTo: self.salePrice.bottomAnchor, constant: 16),
            eventLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            eventLabel.widthAnchor.constraint(equalToConstant: 77),
            eventLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func configureSectionBottom() {
        self.view.addSubview(sectionBottom)
        
        sectionBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionBottom.topAnchor.constraint(equalTo: self.eventLabel.bottomAnchor, constant: 24),
            sectionBottom.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sectionBottom.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            sectionBottom.heightAnchor.constraint(equalToConstant: 1),
            sectionBottom.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setRawPriceAttribute(label: UILabel, text: String) {
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(.strikethroughStyle,
                                        value: NSUnderlineStyle.single.rawValue,
                                        range: NSMakeRange(0, attributeString.length))
        label.attributedText = attributeString
        label.baselineAdjustment = .alignCenters
    }
}
