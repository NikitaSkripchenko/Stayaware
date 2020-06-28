//
//  NotificationsTableViewCell.swift
//  Stayaware
//
//  Created by Trexoz MCL on 11.04.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import Foundation
import SnapKit

class NotificationsTableViewCell : UITableViewCell {
    
    lazy var titleLabel = UILabel()
    lazy var descriptionLabel = UILabel()
    lazy var content = UIView(frame: CGRect(x:8 , y:0 , width: UIScreen.main.bounds.width - 16, height: 120))
    lazy var actionTitle = UILabel()
    lazy var actionImage = UIImageView()
    lazy var stackView = UIStackView()
    var id: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func configure(title: String, description: String, id: Int) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        self.id = id
    }
    
    func setupUI() {
        content.addSubview(titleLabel)
        content.addSubview(descriptionLabel)
        content.addSubview(actionImage)
        content.addSubview(actionTitle)
        content.addSubview(stackView)
        
        actionImage.image = UIImage(named: "arrow")
        content.layer.cornerRadius = 6
        content.layer.applySketchShadow(alpha: 0.1, blur: 8, spread: 3)
        actionTitle.text = "читати далі"
        self.backgroundColor = .clear
        self.addSubview(content)
       
        if #available(iOS 13.0, *) {
            actionImage.tintColor = .label
            content.backgroundColor = .secondarySystemBackground
        } else {
            // Fallback on earlier versions
            actionImage.tintColor = .black
            content.backgroundColor = .white
        }
        arrangeViews()
    }
    
    func arrangeViews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(actionTitle)
        stackView.addArrangedSubview(actionImage)
        
        stackView.snp.makeConstraints { (make) in
            make.bottom.right.equalTo(content).offset(-16)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(content).offset(16)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(content).offset(16)
        }
    }
}


