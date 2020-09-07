//
//  AppModel.swift
//  GuessTheNumberTDD
//
//  Created by Natalia Kazakova on 07.09.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import Foundation

class AppModel {
    
    var number: Int = 0
    var attemptsNumber: Int = 0
    private var attemptsEnded: Bool {
        get {
            return attemptsNumber == 0
        }
    }
    
    init() {
        self.initValues()
    }
    
    func processingNumber(_ number: Int) -> ProcessResult {
        attemptsNumber -= 1
        
        if attemptsEnded {
            return .attemptsEnded
        } else if number > self.number {
            return .greater
        } else if number < self.number {
            return .less
        }
        
        return .equal
    }
    
    func restart() {
        initValues()
    }
    
    private func initValues() {
        number = Int.random(in: 1...10)
        attemptsNumber = 3
    }
}
