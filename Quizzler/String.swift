//
//  String.swift
//  Quizzler
//
//  Created by Hady Hammad on 10/29/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

extension String{
    func replaceQuot() -> String{
        return self.replacingOccurrences(of: "&quot;", with: "\"").replacingOccurrences(of: "&#039;", with: "'")
    }
}
