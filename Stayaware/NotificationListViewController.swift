//
//  NotificationListViewController.swift
//  Stayaware
//
//  Created by Trexoz MCL on 10.04.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import UIKit
import SnapKit

class NotificationListViewController: UIViewController {

    lazy var tableView = UITableView()
    var layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
}
