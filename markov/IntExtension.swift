//
//  IntExtension.swift
//  markov
//
//  Created by Edward Loveall on 10/25/15.
//  Copyright © 2015 Edward Loveall. All rights reserved.
//

import Foundation

public extension Int {
    public static func random(upper: Int = 100) -> Int {
        return Int(arc4random_uniform(UInt32(upper)))
    }
}
