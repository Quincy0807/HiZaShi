//
//  WordCrownDelegate.swift
//  HiZashi WatchKit Extension
//
//  Created by QuincyLegato on 2018/9/28.
//  Copyright © 2018 Quincy. All rights reserved.
//

import Foundation
import WatchKit

class WordCrownDelegate: NSObject, WKCrownDelegate {
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        print(rotationalDelta)
    }
}
