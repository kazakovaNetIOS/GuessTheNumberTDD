//
//  IntExtension.swift
//  GuessTheNumberTDD
//
//  Created by Natalia Kazakova on 07.09.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import Foundation

extension Int {
    static func random(range: Range<Int> ) -> Int {
        var offset = 0
        
        if range.startIndex < 0   {
            offset = abs(range.startIndex)
        }
        
        let min = UInt32(range.startIndex + offset)
        let max = UInt32(range.endIndex + offset)
        
        return Int(min + arc4random_uniform(max - min)) - offset
    }
}
