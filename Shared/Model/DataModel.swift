//
//  DataModel.swift
//  HiZashi
//
//  Created by QuincyLegato on 2018/10/2.
//  Copyright © 2018 Quincy. All rights reserved.
//

import Foundation
import RealmSwift

private let realm :Realm = {
    let config = Realm.Configuration(
        fileURL: Bundle.main.url(forResource: "tango_data", withExtension: "realm"), readOnly: true,
        schemaVersion: 4
    )
    return try! Realm(configuration: config)
}()

class DataModel {
    class func allTanGos() -> Results<TanGo> {
        return realm.objects(TanGo.self)
    }
}
