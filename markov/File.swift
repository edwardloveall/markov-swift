//
//  File.swift
//  markov
//
//  Created by Edward Loveall on 10/21/15.
//  Copyright © 2015 Edward Loveall. All rights reserved.
//

import Foundation

class File {
    class func open (path: NSString, utf8: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        let expandedPath = path.stringByStandardizingPath
        let fileURL = NSURL(fileURLWithPath: expandedPath)

        do {
            return try String(contentsOfURL: fileURL)
        } catch let error {
            print(error)
            return nil
        }
    }
}
