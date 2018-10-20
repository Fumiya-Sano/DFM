//
//  RecipeTableViewCell.swift
//  DigitalFoodManipulater
//
//  Created by 小田将也 on 2018/10/20.
//  Copyright © 2018年 Jenove_ze. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView! //レシピ画像
    @IBOutlet weak var recipeTitleLabel: UILabel!    //タイトル
    
    var recipeUrl: String? //URL
    
    override func prepareForReuse() {
        recipeImageView.image = nil
    }
}
