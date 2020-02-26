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
    
   
    let alertDuration: Double = 1.5
    
    var topicIndex: Int = 0;
    
    var exampleUser = UserModel(email: "homer@gmail.com", name: "Homer Simpson", picture: "homer-simpson", goal: "Goal: Learn iOS by participating in a hackathon", likedTopics: [])
        
    let allTopics: [TopicModel] = [
        TopicModel(name: "iOS", picture: "Apple_gray_logo", description: "Learn about iOS Development using the Swift programming language in this module.", links: ["https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/"], people: ["Yooo"], events: []),
        TopicModel(name: "AWS", picture: "aws_logo", description: "Learn all about AWS in this education module, offered through Amazon.", links: ["https://aws.amazon.com/training/"], people: ["Ma"], events: []),
        TopicModel(name: "Docker", picture: "docker_whale", description: "Learn about Docker containerization in this amazing educational session.", links: ["https://docs.docker.com/get-started/"], people: ["Ta"], events: []),
        TopicModel(name: "Android", picture: "android-image", description: "Learn about android App development using the Kotlin programming language in this amazing educational session.", links: ["https://docs.android.com/get-started/"], people: ["la"], events: [])
    ];
    
    let defaultTopic: TopicModel = TopicModel(name: "You nailed it!", picture: "homer-simpson", description: "", links: ["https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/"], people: ["Yooo"], events: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.topicLabelField.text = allTopics[topicIndex].name
        self.topicImageView.image = UIImage(named: allTopics[topicIndex].picture)
        self.navigationItem.title = "Glider"
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

        nextTopic(wasLiked: true)
    }
    
    @IBAction func onLeftButtonClick(_ sender: UIButton) {
        nextTopic()
    }
    
    @IBAction func onRightButtonClick(_ sender: UIButton) {
        exampleUser.likedTopics.append(allTopics[topicIndex].name)
        print(exampleUser.likedTopics.count)

        nextTopic(wasLiked: true)
        
    }
    
    public func nextTopic(wasLiked: Bool = false) {
        
        let animationStyle = UIView.AnimationOptions.transitionFlipFromLeft
        
        if (wasLiked) {
            let title = "Added!"
            let alertMessage = "Successfully added \(allTopics[topicIndex].name) to your learning journey"
            let alert = UIAlertController(title:title, message: alertMessage, preferredStyle: .alert)
            self.present(alert, animated: true)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + alertDuration) {
                  alert.dismiss(animated: true)
            }
        }
      
        
        
        repeat {
            topicIndex = (topicIndex + 1) % allTopics.count
            if (!exampleUser.likedTopics.contains(allTopics[topicIndex].name)) {
                topicLabelField.text = allTopics[topicIndex].name
//                topicImageView.image = UIImage(named: allTopics[topicIndex].picture)
                UIView.transition(with: topicImageView,
                 duration: 0.75,
                 options: animationStyle,
                 animations: { self.topicImageView.image = UIImage(named: self.allTopics[self.topicIndex].picture ) },
                 completion: nil)
                break;
            }
        } while (exampleUser.likedTopics.count < allTopics.count)
        
        if (exampleUser.likedTopics.count == allTopics.count)
        {
            topicLabelField.text = defaultTopic.name
//            topicImageView.image = UIImage(named: defaultTopic.picture)
            UIView.transition(with: topicImageView,
             duration: 0.75,
             options: animationStyle,
             animations: { self.topicImageView.image = UIImage(named: self.defaultTopic.picture) },
             completion: nil)
        }
        
 
        
        
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
