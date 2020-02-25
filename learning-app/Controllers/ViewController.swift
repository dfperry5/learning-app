//
//  ViewController.swift
//  learning-app
//
//  Created by Dylan Perry on 2/25/20.
//  Copyright © 2020 Beat Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myarray = ["Swipe Page", "Topic Page", "User Page"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
    }
    
    
    @IBAction func userPageButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "ToUserPage", sender: self)
    }
    
    
    @IBAction func swipePageButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "ToSwipePage", sender: self)
    }
    
    @IBAction func topicPageButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "ToTopicPage", sender: self)
    }
}


