//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Hady Hammad on 10/24/19.
//  Copyright © 2019 Hady Hammad. All rights reserved.
//

import Foundation
import Alamofire
class QuestionBank{
    
    var list = [Question]()
    
    init(data: Dictionary<String,Any>) {
        
        guard let arr = data["results"] as? [Dictionary<String,Any>] else {return}
        
        for item in arr{
            
            let quest = item["question"] as! String
            let ans = item["correct_answer"] as! String
            let category = item["category"] as! String
            
            list.append(Question(text: quest, correctAnswer: ans, categoryName: category))
            
        }
    }
    
}
