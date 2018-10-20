//
//  recipeController.swift
//  DigitalFoodManipulater
//
//  Created by 佐野文哉 on 2018/10/20.
//  Copyright © 2018年 Jenove_ze. All rights reserved.
//

import UIKit

class recipeController: UITableViewController {
    
    var recipeDataArray = [RecipeData]()
    var imageCache = NSCache<AnyObject, UIImage>()
    var recipename = "おつまみに！タラモ春巻き"
    var pageurl = "https://recipe.rakuten.co.jp/recipe/1170006099/"
    var imageurl = "https://image.space.rakuten.co.jp/d/strg/ctrl/3/e02b25d40463829442f1b0cec17231ef015e6962.94.2.3.2.jpg"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        var recipe = RecipeData(name: recipename, url: pageurl)
        recipeDataArray.append(recipe)
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItemself.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipeDataArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        let recipeData = recipeDataArray[indexPath.row]
        cell.recipeTitleLabel.text = recipeData.name
        cell.recipeUrl = recipeData.url
        
        guard let recipeImageUrl = recipeData.imageInfo.medium else {
            return cell
        }
        
        if let cacheImage = imageCache.object(forKey: recipeImageUrl as AnyObject) {
            cell.recipeImageView.image = cacheImage
            return cell
        }
        
        guard let url = URL(string: recipeImageUrl) else {
            return cell
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
                
            }
            guard let image = UIImage(data: data) else {
                return
            }
            self.imageCache.setObject(image, forKey: recipeImageUrl as AnyObject)
            DispatchQueue.main.async {
                cell.recipeImageView.image = image
            }
        }
        
        task.resume()
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? RecipeTableViewCell {
            if let recipeUrlController = segue.destination as? recipeUrlController {
                recipeUrlController.recipeUrl = cell.recipeUrl!
            }
        }
    }

}
