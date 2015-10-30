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
        addAllWords()
    }
    
    func addWord(wordString: String, follower: String) {
        let word = words[wordString] ?? Word(string: wordString)
        word.addFollower(follower)
        words[wordString] = word
    }

    func addAllWords() {
        let allLines = WordParser(text: fullText).lines
        for line in allLines {
            for (i, wordString) in line.enumerate() {
                if let follower = line[safe: i + 1] {
                    addWord(wordString, follower: follower)
                }
            }
        }
    }
    
    func sentence() -> String {
        let randomStarterIndex = Int.random(words.count)
        var prevWord = Array(words.keys)[randomStarterIndex]
        var sentenceWords: [String] = [prevWord]

        while(true) {
            if let nextWord = words[prevWord] {
                prevWord = nextWord.weightedFollower()
                sentenceWords.append(prevWord)
            } else { break }
        }

        return sentenceWords.joinWithSeparator(" ")
    }
}
