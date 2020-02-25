//
//  SwipePageViewController.swift
//  learning-app
//
//  Created by Dylan Perry on 2/25/20.
//  Copyright © 2020 Beat Team. All rights reserved.
//

import UIKit

class SwipePageViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var topicLabelField: UILabel!
    @IBOutlet weak var topicImageView: UIImageView!
    @IBOutlet var swipeUpGestureRecognizer: UISwipeGestureRecognizer!

    var topicIndex: Int = 0;
    
    var exampleUser = UserModel(email: "homer@gmail.com", name: "Homer Simpson", picture: "homer-simpson", goal: "Goal: Learn iOS by participating in a hackathon", likedTopics: [])
        
    let allTopics: [TopicModel] = [
        TopicModel(name: "iOS", picture: "Apple_gray_logo", description: "Learn about iOS Development using the Swift programming language in this module.", links: ["https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/"], people: ["Yooo"], events: []),
        TopicModel(name: "AWS", picture: "aws_logo", description: "Learn all about AWS in this education module, offered through Amazon.", links: ["https://aws.amazon.com/training/"], people: ["Ma"], events: []),
        TopicModel(name: "Docker", picture: "docker_whale", description: "Learn about Docker containerization in this amazing educational session.", links: ["https://docs.docker.com/get-started/"], people: ["Ta"], events: []),
         TopicModel(name: "Android", picture: "android-image", description: "Learn about android App development using the Kotlin programming language in this amazing educational session.", links: ["https://docs.android.com/get-started/"], people: ["la"], events: [])
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.topicLabelField.text = allTopics[topicIndex].name
        self.topicImageView.image = UIImage(named: allTopics[topicIndex].picture)
    }
    
    //MARK: Actions
    @IBAction func onSwipeUpAction(_ sender: UISwipeGestureRecognizer) {
        
    }
    
    @IBAction func onSwipeLeftAction(_ sender: UISwipeGestureRecognizer) {
        nextTopic()
    }
    
    @IBAction func onSwipeRightAction(_ sender: UISwipeGestureRecognizer) {
        exampleUser.likedTopics.append(allTopics[topicIndex].name)
        print(exampleUser.likedTopics.count)

        nextTopic()
    }
    
    @IBAction func onLeftButtonClick(_ sender: UIButton) {
        nextTopic()
    }
    
    @IBAction func onRightButtonClick(_ sender: UIButton) {
        exampleUser.likedTopics.append(allTopics[topicIndex].name)
        print(exampleUser.likedTopics.count)

        nextTopic()
        
    }
    
    public func nextTopic() {
        topicIndex = (topicIndex + 1) % allTopics.count
        topicLabelField.text = allTopics[topicIndex].name;
        topicImageView.image = UIImage(named: allTopics[topicIndex].picture)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? UserPageViewController {
            nextVC.user = exampleUser
        }
    }
    
    @IBAction func profileButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: Constants.SWIPE_PAGE_TO_USER_PAGE_SEGUE, sender: self)
    }
    
    
    
}
