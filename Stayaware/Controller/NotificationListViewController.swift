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
    
    private var notificationsDataSource : TableViewDataSource<NotificationsTableViewCell, NotificationModel>?
    private var notifications : [NotificationModel]?
    
    override func viewDidLoad() {
        self.view.addSubview(tableView)
        notifications = [NotificationModel(id: 0, title: "hey", description: "hey hey"), NotificationModel(id: 0, title: "hey", description: "hey hey")]
        tableView.reloadData()
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
            
        }
        configureTableView()
    }
    
}


private extension NotificationListViewController {
    func configureTableView() {
        tableView.delegate = self
        tableView.rowHeight = 128
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tableView.register(NotificationsTableViewCell.self)
        tableView.tableFooterView = UIView()
        notificationsDataSource = TableViewDataSource(data: notifications!, cellClass: NotificationsTableViewCell.self, cellConfigurator: { (notification, cell, index) in
            cell.configure(title: notification.title, description: notification.description, id: notification.id)
        })
        
        tableView.dataSource = notificationsDataSource
    }
}


extension NotificationListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
