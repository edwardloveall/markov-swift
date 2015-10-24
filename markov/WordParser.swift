//
//  WordParser.swift
//  markov
//
//  Created by Edward Loveall on 10/23/15.
//  Copyright © 2015 Edward Loveall. All rights reserved.
//

import Foundation

class WordParser {
    let fullText: String
    var lines: [[String]] {
        get {
            let lineArray = fullText.componentsSeparatedByString("\n")
            return lineArray.map { (let line) -> [String] in
                return line.componentsSeparatedByString(" ")
            }
        }
    }
    
    init(text: String) {
        fullText = text
    }
}
