//
//  ScoreVC.swift
//  Quizzler
//
//  Created by Hady Hammad on 10/26/19.
//  Copyright © 2019 Hady Hammad. All rights reserved.
//

import UIKit

class ScoreVC: UIViewController{
    
    // MARK :- Outlets
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreImage: UIImageView!
    @IBOutlet weak var highScoreBackView: UIView!
    @IBOutlet weak var highScoreView: UIView!
    
    // MARK :- Instance variables
    var score:Int = 0
    var category:String = ""
    
    // MARK :- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
    }
    
    // MARK :- SetupUI
    func setupComponents(){
        highScoreBackView.addCornerRadius(15)
        highScoreView.addCornerRadius(20)
        highScoreView.addNormalShadow()
        updateScoreUI(score: score, category: category)
    }
    
    // MARK :- Actions
    @IBAction func buRestart(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let chooseCategory = storyboard.instantiateViewController(withIdentifier: "ChooseCategory") as? ChooseCategory
        present(chooseCategory!, animated: true, completion: nil)
    }
    
    private func updateScoreUI(score: Int, category: String){
        if score > 6 {
            scoreImage.image = UIImage(named: "happy")
        }
        self.scoreLabel.text = "\(score)"
        let highScore = UserDefaults.standard.integer(forKey: category)
        self.highScoreLabel.text = "High score is \(highScore)"
    }
    
}
