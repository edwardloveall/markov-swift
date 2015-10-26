//
//  main.swift
//  markov
//
//  Created by Edward Loveall on 10/21/15.
//  Copyright © 2015 Edward Loveall. All rights reserved.
//

import Foundation

if let contents = File.open(Process.arguments[1]) {
    var marokv = Markov(text: contents)
    print(marokv.sentence())
}
