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
        return fullText.componentsSeparatedByString("\n")
                       .map { $0.componentsSeparatedByString(" ") }
    }
    
    init(text: String) {
        fullText = text
    }
}
