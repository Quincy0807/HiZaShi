//
//  Schedule.swift
//  HiZashi
//
//  Created by QuincyLegato on 2018/9/30.
//  Copyright © 2018 Quincy. All rights reserved.
//

import Foundation
import RealmSwift

class Schedule: Object {
    @objc dynamic var date = Date()
    let goI = [TanGo]()
}
