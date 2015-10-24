//
//  Word.swift
//  markov
//
//  Created by Edward Loveall on 10/23/15.
//  Copyright © 2015 Edward Loveall. All rights reserved.
//

import Foundation

class Word {
    var followers = [String: Int]()
    let string: String
    
    init(string: String) {
        self.string = string
    }
    
    func addFollower(word: String) {
        if let follower = followers[word] {
            followers.updateValue(follower.successor(), forKey: word)
        } else {
            followers.updateValue(1, forKey: word)
        }
    }
}
