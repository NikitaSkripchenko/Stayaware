//
//  Status.swift
//  Stayaware
//
//  Created by Trexoz MCL on 09.04.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import UIKit

enum Status: String {
    case healthy = "Здоров"
    case sick = "Хворий"

    func getColor() -> UIColor {
        switch self {
        case .healthy:
            return Constants.Colors.doneGreen
        case .sick:
            return Constants.Colors.errorRed
        }
    }
}
