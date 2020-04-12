//
//  NotificationsPanelLayout.swift
//  Stayaware
//
//  Created by Trexoz MCL on 10.04.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import Foundation
import FloatingPanel

class NotificationPanelLayout : FloatingPanelLayout {
    public var initialPosition: FloatingPanelPosition {
        return .half
    }
    public var supportedPositions: Set<FloatingPanelPosition> {
        return [ .half]
    }
    
    public func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        switch position {
        //case .full: return 16.0
        case .half: return 264
        default: return nil
        }
    }
}
