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
    
    @IBOutlet weak var userImage: UIImageView!
        
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var userGoalLabel: UILabel!
    
    
    @IBOutlet weak var userLikedTopicsTable: UITableView!
    
    let exampleUser = UserModel(email: "homer@gmail.com", name: "Homer Simpson", picture: "homer-simpson", goal: "Learn iOS.", likedTopics: ["iOS"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userNameLabel.text = exampleUser.name
        userImage.image = UIImage(named: exampleUser.picture)
        userEmailLabel.text = exampleUser.email
        userGoalLabel.text = exampleUser.goal
        userLikedTopicsTable.delegate = self
        userLikedTopicsTable.dataSource = self
        userLikedTopicsTable.tableFooterView = UIView()
    }
}

extension UserPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleUser.likedTopics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        cell.textLabel?.text = exampleUser.likedTopics[indexPath.item]
        
        return cell
    }
}

extension UserPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.item)
        print(exampleUser.likedTopics[indexPath.item])
        // 1. Set some value on here to be "Selected Item"
        // 2. Call a function to perform a segue to Topic Page
        // 3. In Topic Page, get value from this class for "Selected Item"
        // 4. Render Topic Page for selected item.
    }
}
