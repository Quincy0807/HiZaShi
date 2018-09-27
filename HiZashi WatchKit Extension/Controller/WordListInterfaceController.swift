//
//  WordListInterfaceController.swift
//  HiZashi WatchKit Extension
//
//  Created by QuincyLegato on 2018/9/27.
//  Copyright © 2018 Quincy. All rights reserved.
//

import WatchKit
import Foundation

class WordListInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var wordListTable: WKInterfaceTable!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let words = DataManager.allWords()
        wordListTable.setNumberOfRows(words.count, withRowType: "WordRow")
        for index in 0..<words.count {
            guard let controller = wordListTable.rowController(at: index) as? WordListRowController else {continue}
            controller.wordEntity=words[index]
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK:- table delegate
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let wordEntity = DataManager.allWords()[rowIndex]
        presentController(withName: "Word", context: wordEntity)
    }
    
}
