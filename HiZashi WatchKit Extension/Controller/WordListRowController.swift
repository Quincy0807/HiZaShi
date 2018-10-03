//
//  WordListRowController.swift
//  HiZashi WatchKit Extension
//
//  Created by QuincyLegato on 2018/9/27.
//  Copyright © 2018 Quincy. All rights reserved.
//

import WatchKit

class WordListRowController: NSObject {
    @IBOutlet weak var wordNameLabel: WKInterfaceLabel!
    
    var tanGo: TanGo? {
        didSet {
            guard let tanGo = tanGo  else {return }
            wordNameLabel.setText(tanGo.word)
        }
    }
}
