//
//  Word.swift
//  HiZashi
//
//  Created by QuincyLegato on 2018/9/26.
//  Copyright © 2018 Quincy. All rights reserved.
//

import Foundation

private let wordEntities: [WordEntity]  = {
    let file  =  Bundle.main.path(forResource: "data", ofType: "json")!
    let jsonData = NSData(contentsOfFile: file)! as Data
    return try! JSONDecoder().decode([WordEntity].self, from: jsonData)
}()



class WordEntity: NSObject, Codable {
    var word: String
    var explaination: String
    var sentence: String
    
    init(word: String, explaination: String, sentence: String) {
        self.word = word
        self.explaination = explaination
        self.sentence = sentence
        super.init()
    }
    
}


class DataManager {
    class func allWords() -> [WordEntity]{
        return wordEntities
    }
}
