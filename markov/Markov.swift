//
//  WordGraph.swift
//  markov
//
//  Created by Edward Loveall on 10/23/15.
//  Copyright © 2015 Edward Loveall. All rights reserved.
//

import Foundation

class Markov {
    var words = [String : Word]()
    var fullText: String
    
    init(text: String) {
        fullText = text
    }
    
    func addWord(wordString: String, follower: String) {
        var word = words[wordString]
        if word == nil {
            word = Word(string: wordString)
        }
        word?.addFollower(follower)
        words[wordString] = word!
    }
    
    func addAllWords() {
        for line in WordParser(text: fullText).lines {
            for (i, wordString) in line.enumerate() {
                if i + 1 < line.endIndex {
                    addWord(wordString, follower: line[i + 1])
                }
            }
        }
    }
    
    func sentence() -> String {
        let randomStarterIndex = Int(arc4random_uniform(UInt32(words.count)))
        var prevWord = Array(words.keys)[randomStarterIndex]
        var sentenceString: [String] = [prevWord]

        while(true) {
            if let nextWord = words[prevWord] {
                prevWord = nextWord.randomFollower()
                sentenceString.append(prevWord)
            } else { break }
        }

        return sentenceString.joinWithSeparator(" ")
    }
}
