//
//  WordGraph.swift
//  markov
//
//  Created by Edward Loveall on 10/23/15.
//  Copyright © 2015 Edward Loveall. All rights reserved.
//

import Foundation

struct WordGraph {
    var words = [String : Word]()
    
    mutating func addWord(wordString: String, follower: String) {
        var word = words[wordString]
        if word == nil {
            word = Word(string: wordString)
        }
        word?.addFollower(follower)
        words[wordString] = word!
    }
}
