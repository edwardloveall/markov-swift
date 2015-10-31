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
        let follower = followers[word] ?? 0
        followers.updateValue(follower.successor(), forKey: word)
    }
    
    func randomFollower() -> String {
        let index = Int.random(followers.count)
        return Array(followers.keys)[index]
    }

    func weightedFollower() -> String {
        let totalWeight = followers.values.reduce(0, combine: +)
        let randomWeight = Int.random(totalWeight)
        var index = 0
        var count = Array(followers.values)[index]
        while(count <= randomWeight) {
            index++
            count += Array(followers.values)[index]
        }
        return Array(followers.keys)[index]
    }
}
