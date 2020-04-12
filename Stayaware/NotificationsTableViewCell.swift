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
        self.backgroundColor = .clear
        content.backgroundColor = .white
        self.addSubview(content)
        content.layer.cornerRadius = 6
        content.layer.applySketchShadow(alpha: 0.1, blur: 8, spread: 3)
        content.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(content).offset(16)
        }
        content.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(content).offset(16)
        }
    }
}


