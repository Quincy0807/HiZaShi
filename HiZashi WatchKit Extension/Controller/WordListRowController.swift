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
    
    var wordEntity: WordEntity? {
        didSet {
            guard let wordEntity = wordEntity else {return }
            wordNameLabel.setText(wordEntity.word)
        }
    }
}
