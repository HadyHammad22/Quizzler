//
//  ShowQuestionsVC.swift
//  Quizzler
//
//  Created by Hady Hammad on 10/25/19.
//  Copyright © 2019 Hady Hammad. All rights reserved.
//

import UIKit
import ProgressHUD

class ShowQuestionsVC: UIViewController{
    
    //instance variables
    var allQuestions : [Question]!
    var category : String?
    var pickedAnswer : String = "False"
    var questionNumber : Int = 0
    var score : Int = 0
    var timer = Timer()
    var time = 0
    
    //Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var loweView: UIView!
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions[0]
        category = firstQuestion.category!
        questionLabel.text = firstQuestion.questionText?.replaceQuot()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
    }
    
    @objc func action(){
        if time == 20{
            time = 0
            questionNumber = questionNumber + 1
            ProgressHUD.showError("Wrong!")
            nextQuestion()
        }else{
            time = time+1
            self.timerLbl.text = "\(time)"
        }
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        time = 0
        if sender.tag == 1{
            pickedAnswer = "True"
        }
            
        else if sender.tag == 2{
            pickedAnswer = "False"
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
    }
    
    
    func updateUI() {
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    
    
    func nextQuestion() {
        
        if questionNumber < allQuestions.count {
            questionLabel.text = allQuestions[questionNumber].questionText?.replaceQuot()
            updateUI()
        }else{
            timer.invalidate()
            performSegue(withIdentifier: "toScore", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScore"{
            guard let scoreVC = segue.destination as? ScoreVC else {return}
            setupHighScore()
            scoreVC.score = self.score
            scoreVC.category = self.category!
        }
    }
    
    func setupHighScore(){
        guard let category = category else{return}
        
        if isKeyPresentInUserDefaults(key: category){
            
            if score > UserDefaults.standard.integer(forKey: category){
                UserDefaults.standard.set(score, forKey: category)
            }
            
        }else{
            UserDefaults.standard.set(score, forKey: category)
        }
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    func checkAnswer() {
        guard let answer = allQuestions[questionNumber].answer else{return}
        if answer == pickedAnswer{
            ProgressHUD.showSuccess("Correct")
            score += 1
        }else{
            ProgressHUD.showError("Wrong!")
        }
    }
    
}
