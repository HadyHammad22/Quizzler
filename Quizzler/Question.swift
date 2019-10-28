//
//  Question.swift
//  Quizzler
//
//  Created by Hady Hammad on 10/24/19.
//  Copyright © 2019 Hady Hammad. All rights reserved.
//

import Foundation
struct Question{
    var questionText:String?
    var answer:String?
    var category:String?
    
    init(text: String, correctAnswer: String, categoryName: String) {
        questionText = text
        answer = correctAnswer
        category = categoryName
    }
    
}
