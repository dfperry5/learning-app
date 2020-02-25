//
//  UserPageViewController.swift
//  learning-app
//
//  Created by Dylan Perry on 2/25/20.
//  Copyright © 2020 Beat Team. All rights reserved.
//

import UIKit

class UserPageViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var Picture: UIImageView!
    
    
    let exampleUser = UserModel(email: "priya@gmail.com", name: "Test Name", picture: "homer-simpson", goal: "Learn iOS today", likedTopics: ["iOS"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userNameLabel.text = exampleUser.name
        Picture.image = UIImage(named: exampleUser.picture)
    }
    
    


}
