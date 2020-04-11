
//
//  File.swift
//  Stayaware
//
//  Created by Trexoz MCL on 11.04.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//
import UIKit

extension UITableView {

    func register(_ cellClasses: UITableViewCell.Type...) {
        cellClasses.forEach { cellClass in
            register(UINib(nibName: cellClass.nib, bundle: nil), forCellReuseIdentifier: cellClass.identifier)
        }
    }

    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.identifier, for: indexPath) as? T else {
            fatalError("Can't dequeue cell with identifier \(cellClass.identifier)")
        }
        return cell
    }
}

