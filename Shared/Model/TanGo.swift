//
//  TanGO.swift
//  HiZashi
//
//  Created by QuincyLegato on 2018/9/30.
//  Copyright © 2018 Quincy. All rights reserved.
//

import Foundation
import RealmSwift

class TanGo: Object{
    @objc dynamic var id = 0
    @objc dynamic var word = ""
    @objc dynamic var tone = 0
    @objc dynamic var explanation = ""
    @objc dynamic var example = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

