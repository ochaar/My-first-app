//
//  ViewController.swift
//  test
//
//  Created by Olivier CHAAR on 9/21/19.
//  Copyright © 2019 Olivier CHAAR. All rights reserved.
//

import UIKit

struct cellData {
    
    let title: String
    let publisher: String
    let rank: Int
    let ingredients: String
    let image: UIImage
}

class TableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var table: UITableView!

    var arrayOfCellData = [cellData]()
    var searchRecipe = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfCellData = [cellData(title: "Jalapeno Cheese Sandwich", publisher: "Closet cooking", rank: 100, ingredients: "Japaleno", image: #imageLiteral(resourceName: "Jalapeno2BPopper2BGrilled2BCheese2BSandwich2B12B500fd186186")),
                           cellData(title: "Chocolate cheesecake", publisher: "Closet cooking",rank: 86, ingredients: "Chocolate", image: #imageLiteral(resourceName: "Guinness2BChocolate2BCheesecake2B12B5002af4b6b4")),
                           cellData(title: "Crash Hot Potatoes", publisher: "The Pioneer Woman",rank: 78, ingredients: "Potatoes", image: #imageLiteral(resourceName: "CrashHotPotatoes5736")),
                           cellData(title: "Banana Bread", publisher: "Simply recipes",rank: 74, ingredients: "Banana", image: #imageLiteral(resourceName: "banana_bread300x2000a14c8c5")),
                           cellData(title: "Best brownies", publisher: "All Recipes",rank: 96, ingredients: "Chocolate", image: #imageLiteral(resourceName: "brownies")),
                           cellData(title: "Parmesan Roasted Potatoes", publisher: "Whats Gaby Cooking",rank: 89, ingredients: "Potatoes", image: #imageLiteral(resourceName: "ParmesanRoastedPotatoes11985a")),
                           cellData(title: "Easy Shepherd's Pie", publisher: "Simply Recipe",rank: 83, ingredients: "1/2 lbs ground round beef", image: #imageLiteral(resourceName: "shepherdspie300x2003d240a98")),
                           cellData(title: "Restaurant Style Salsa", publisher: "The Pioneer Woman",rank: 80, ingredients: "Tomato juice", image: #imageLiteral(resourceName: "salsa"))]
        searchRecipe = arrayOfCellData
        alterlayout()
    }
    
    func alterlayout() {
        table.tableHeaderView = UIView()
        //search bar in header
        table.estimatedSectionHeaderHeight = 50
        searchBar.placeholder = "Search by Name"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchRecipe.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //This line break searchbar?
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.mainImage.image = arrayOfCellData[indexPath.row].image
        cell.mainLabel.text = arrayOfCellData[indexPath.row].title
        cell.Label.text = arrayOfCellData[indexPath.row].publisher
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return searchBar
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //size of cell
        return 250
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            searchRecipe = arrayOfCellData
            table.reloadData()
            return
        }
        searchRecipe = arrayOfCellData.filter({ cellData -> Bool in return cellData.title.lowercased().contains(searchText.lowercased())
        })
        table.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        self.performSegue(withIdentifier: "MoreInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let SecondView = segue.destination as? ViewController
        let index = tableView.indexPathForSelectedRow?.row
        SecondView!.receivedData = arrayOfCellData[index!]
        //print(SecondView!.receivedData)
    }
    
}
