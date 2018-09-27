//
//  InterfaceController.swift
//  HiZashi WatchKit Extension
//
//  Created by QuincyLegato on 2018/09/25.
//  Copyright © 2018年 Quincy. All rights reserved.
//

import WatchKit
import Foundation


class WordInterfaceController: WKInterfaceController, WKCrownDelegate {
    @IBOutlet weak var wordLabel: WKInterfaceLabel!
    @IBOutlet weak var explainationLabel: WKInterfaceLabel!
    @IBOutlet weak var sentenceLabel: WKInterfaceLabel!
    
    private var fromWordsList = false
    private var currentWordEntitry: WordEntity? = nil
    private let maxFontSize = WORD_ENTITY_MAX_FONT_SIZE
    private let minFontSize = WORD_ENTITY_MIN_FONT_SIZE
    private var currentFontSize = WORD_ENTITY_MIN_FONT_SIZE
    
    // MARK:- IBActions
    
    @IBAction func onTap(){
        randomWord()
        updateWordEntity()
    }
    
    @IBAction func allWordsListNavigation(){
        if fromWordsList {
            dismiss()
        }
        else {
            pushController(withName: "WordList", context:nil)
        }
    }
    
    // MARK:- lifecycle methods
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.crownSequencer.delegate = self
        self.setTitle("日差し")
        if let wordEntity = context as? WordEntity {
            currentWordEntitry = wordEntity
            fromWordsList = true
        }else{
            randomWord()
        }
        updateWordEntity()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.crownSequencer.focus()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK:- crown delegate
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        let delta = rotationalDelta > WORD_FONT_SIZE_CHANGE_THRESHOLD ? -1 : rotationalDelta < -WORD_FONT_SIZE_CHANGE_THRESHOLD ? 1 : 0
        currentFontSize += delta
        if currentFontSize > maxFontSize || currentFontSize < minFontSize {
            currentFontSize -= delta
            return
        }
        updateWordEntity()
    }
    
    
    // MARK:- helper functions
    func randomWord(){
        let wordEntities = DataManager.allWords()
        let size = wordEntities.count
        var nextWordEntity: WordEntity? = nil
        repeat {
            let randomInt = Int.random(in: 0..<size)
            nextWordEntity = wordEntities[randomInt]
        }while(nextWordEntity == currentWordEntitry)
        currentWordEntitry = nextWordEntity
    }
    
    func updateWordEntity(){
        let currentWordEntitry = self.currentWordEntitry!
        setText(currentWordEntitry.word, for: wordLabel)
        setText(currentWordEntitry.explaination, for: explainationLabel)
        setText(currentWordEntitry.sentence, for: sentenceLabel)
    }
    
    func setText(_ text: String, for label: WKInterfaceLabel){
        let font = UIFont.systemFont(ofSize: CGFloat(currentFontSize))
        let fontAttrs = [NSAttributedString.Key.font : font]
        let fontAttrString = NSAttributedString(string: text, attributes: fontAttrs as [NSAttributedString.Key : Any])
        label.setAttributedText(fontAttrString)
    }
}
