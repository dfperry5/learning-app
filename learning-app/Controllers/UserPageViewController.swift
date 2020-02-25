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
    

    var user: UserModel?
    var selectedTopic: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let exampleUser = user {
            userNameLabel.text = exampleUser.name
            userImage.image = UIImage(named: exampleUser.picture)
            userEmailLabel.text = exampleUser.email
            userGoalLabel.text = exampleUser.goal
            userLikedTopicsTable.delegate = self
            userLikedTopicsTable.dataSource = self
            userLikedTopicsTable.tableFooterView = UIView()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? TopicPageViewController {
            if let currentTopic = selectedTopic {
                nextVC.passedInTopic = currentTopic
            }
       }
    }
    
}

extension UserPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let exampleUser = user {
            //print(exampleUser.likedTopics.count)
            return exampleUser.likedTopics.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        if let exampleUser = user {
            //print(indexPath.item)
            //print(exampleUser.likedTopics[indexPath.item])
            cell.textLabel?.text = exampleUser.likedTopics[indexPath.item]
        }
       
        return cell
    }
}

extension UserPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let exampleUser = user {
            //print(indexPath.item)
            //print(exampleUser.likedTopics[indexPath.item])
            selectedTopic = exampleUser.likedTopics[indexPath.item]
            performSegue(withIdentifier: Constants.USER_PAGE_TO_TOPIC_PAGE_SEGUE, sender: self)
        }
        // 1. Set some value on here to be "Selected Item"
        // 2. Call a function to perform a segue to Topic Page
        // 3. In Topic Page, get value from this class for "Selected Item"
        // 4. Render Topic Page for selected item.
    }
}
