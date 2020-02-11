//
//  ChooseCategory.swift
//  Quizzler
//
//  Created by Hady Hammad on 10/24/19.
//  Copyright © 2019 Hady Hammad. All rights reserved.
//

import UIKit
import Alamofire
import ProgressHUD

class ChooseCategory: UIViewController {
    
    @IBOutlet weak var categoryCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCV.register(UINib(nibName: String(describing: CategoryCVC.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CategoryCVC.self))
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

extension ChooseCategory: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = categoryCV.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCVC.self), for: indexPath) as! CategoryCVC
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2 - 10, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            getAnyQuestions(url: URLs.anyCategory)
        case 1:
            getAnyQuestions(url: URLs.sports)
        case 2:
            getAnyQuestions(url: URLs.history)
        case 3:
            getAnyQuestions(url: URLs.music)
        case 4:
            getAnyQuestions(url: URLs.computer_science)
        case 5:
            getAnyQuestions(url: URLs.nature)
        case 6:
            getAnyQuestions(url: URLs.general_knowledge)
        case 7:
            getAnyQuestions(url: URLs.geography)
        default:
            print("Not selected")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
