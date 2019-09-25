//
//  SecondViewController.swift
//  My First App
//
//  Created by Olivier CHAAR on 9/24/19.
//  Copyright © 2019 Olivier CHAAR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var receivedData: cellData!
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var titlercp: UILabel!
    @IBOutlet var publisher: UILabel!
    @IBOutlet var rank: UILabel!
    @IBOutlet var ingredients: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = receivedData.image
        publisher.text = receivedData.publisher
        titlercp.text = receivedData.title
        rank.text = String(receivedData.rank)
        ingredients.text = receivedData.ingredients
    }

}
