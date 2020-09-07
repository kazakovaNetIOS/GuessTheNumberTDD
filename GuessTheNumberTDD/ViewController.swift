//
//  ViewController.swift
//  GuessTheNumberTDD
//
//  Created by Natalia Kazakova on 07.09.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import UIKit

extension ProcessResult {
    var resultLabel: String {
        switch self {
            case .equal:
                return "Точно!"
            case .less:
                return "Недолет"
            case .greater:
                return "Перебор"
            case .attemptsEnded:
                return "Попытки закончились"
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

