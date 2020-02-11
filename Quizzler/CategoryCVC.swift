//
//  CategoryCVC.swift
//  Quizzler
//
//  Created by Hady Hammad on 2/11/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import UIKit

class CategoryCVC: UICollectionViewCell {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupComponents()
    }
    
    // MARK :- SetupUI
    func setupComponents(){
        categoryView.addCornerRadius(10)
        categoryView.addNormalShadow()
    }
    
    func configure(category: Category){
        self.categoryNameLbl.text = category.name
        self.categoryImage.image = UIImage(named: category.name!)
    }

}
