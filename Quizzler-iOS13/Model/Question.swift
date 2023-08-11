//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Emir Türk on 29.06.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    var text: String
    var answer:String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
    
}
