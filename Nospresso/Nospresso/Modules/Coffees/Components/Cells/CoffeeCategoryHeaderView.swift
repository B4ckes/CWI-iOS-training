//
//  CoffeeCategoryHeaderView.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 17/10/20.
//

import UIKit

class CoffeeCategoryHeaderView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    
    func config(to category: CoffeeCategory) {
        titleLabel.text = category.category
    }
}
