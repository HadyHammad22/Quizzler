//
//  ChooseCategory.swift
//  Quizzler
//
//  Created by Hady Hammad on 10/24/19.
//  Copyright © 2019 Hady Hammad. All rights reserved.
//

import UIKit
import Alamofire

class ChooseCategory: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            getAnyQuestions(url: URLs.anyCategory)
        case 2:
            getAnyQuestions(url: URLs.sports)
        case 3:
            getAnyQuestions(url: URLs.history)
        case 4:
            getAnyQuestions(url: URLs.music)
        case 5:
            getAnyQuestions(url: URLs.computer_science)
        case 6:
            getAnyQuestions(url: URLs.nature)
        case 7:
            getAnyQuestions(url: URLs.general_knowledge)
        case 8:
            getAnyQuestions(url: URLs.geography)
        default:
            print("Not selected")
        }
    }
    
    private func getAnyQuestions(url: String) {
        
        ProgressHUD.show()
        loadQuestion(url: url, completion: { (arr) in
            ProgressHUD.dismiss()
            self.performSegue(withIdentifier: "toQuiz", sender: arr)
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuiz"{
            guard let viewController = segue.destination as? ShowQuestionsVC else {return}
            if let arr = sender as? [Question]{
                viewController.allQuestions = arr
            }
        }
    }
    
    private func loadQuestion(url: String,completion: @escaping (_ listOfQuestions:[Question])->()){
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
                
            case .success(_):
                guard let data = response.result.value as? Dictionary<String,Any> else {return}
                let allQuestions = QuestionBank(data: data)
                completion(allQuestions.list)
            case .failure(_):
                ProgressHUD.showError("Error")
                break
            }
            
        }
        
    }
    
}
