//
//  CollectionViewLayout.swift
//  Stayaware
//
//  Created by Trexoz MCL on 11.04.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//
import UIKit

final class TableViewDataSource<Cell: UITableViewCell, Model>: NSObject, UITableViewDataSource {

    // MARK: - Nested Types
    typealias CellConfigurator = (Model, Cell, Int) -> Void

    // MARK: - Pirivate Properties
    private var data: [Model]
    private var cellClass: Cell.Type
    private var cellConfigurator: CellConfigurator
    //private let multiplier = 1000

    // MARK: - Initialization
    init(data: [Model], cellClass: Cell.Type, cellConfigurator: @escaping CellConfigurator) {
        self.data = data
        self.cellClass = cellClass
        self.cellConfigurator = cellConfigurator
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass, for: indexPath)
        let model = data[indexPath.item]
        cellConfigurator(model, cell, indexPath.row)
        return cell
    }

}
