//
//  Category.swift
//  Quizzler
//
//  Created by Hady Hammad on 2/11/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation
struct Category{
    var name:String?
    var image:String?
    var list = [Category]()
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    init() {
        self.list.append(Category(name: "ANY CATEGORY", image: "any"))
        self.list.append(Category(name: "SPORTS", image: "sport"))
        self.list.append(Category(name: "HISTORY", image: "history"))
        self.list.append(Category(name: "MUSIC", image: "music"))
        self.list.append(Category(name: "COMPUTER SCIENCE", image: "computer"))
        self.list.append(Category(name: "NATURE", image: "nature"))
        self.list.append(Category(name: "GENERAL KNOWLEDGE", image: "knowledge"))
        self.list.append(Category(name: "GEOGRAPHY", image: "geography"))
    }
}
