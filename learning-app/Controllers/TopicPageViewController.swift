//
//  TopicPageViewController.swift
//  learning-app
//
//  Created by Dylan Perry on 2/25/20.
//  Copyright © 2020 Beat Team. All rights reserved.
//

import UIKit

class TopicPageViewController: UIViewController {

    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var topicImageView: UIImageView!
    @IBOutlet weak var topicDescriptionLabel: UILabel!
    
    @IBOutlet weak var topicResourcesLabel: UILabel!
    
    @IBOutlet weak var topicResourcesLinksButton: UIButton!
    @IBOutlet weak var topicInterestLabel: UILabel!
    
    @IBOutlet weak var topicEventsHeadingLabel: UILabel!
    
    @IBAction func tapTopicResourcesLinkButton(_ sender: UIButton) {
        print("Hello")
    }
    
    var passedInTopic: String?
    
    let sampleTopic = TopicModel(name: "iOS Developement", picture: "Apple_gray_logo", description: "For those interested in learning more about making an iOS app for iPhones! This is the best topic, you should learn this for sure", links: ["www.apple.com","www.google.com"], people: [], events: [EventModel(name: "iOS Training Camp", date: Date(), location: "MMK Innovation Garage", description: "Come learn iOS with the best team ever!", links: [])])
    
    let allTopics: [TopicModel] = [
        TopicModel(name: "iOS", picture: "Apple_gray_logo", description: "Learn about iOS Development using the Swift programming language in this module.", links: ["https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/"], people: ["Yooo"], events: []),
        TopicModel(name: "AWS", picture: "aws_logo", description: "Learn all about AWS in this education module, offered through Amazon.", links: ["https://aws.amazon.com/training/"], people: ["Ma"], events: []),
        TopicModel(name: "Docker", picture: "docker_whale", description: "Learn about Docker containerization in this amazing educational session.", links: ["https://docs.docker.com/get-started/"], people: ["Ta"], events: []),
         TopicModel(name: "Android", picture: "android-image", description: "Learn about android App development using the Kotlin programming language in this amazing educational session.", links: ["https://docs.android.com/get-started/"], people: ["la"], events: [])
    ];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // HEADING
        if let topic = passedInTopic {
//            topicNameLabel.text = allTopics.sampleTopic.name
//            topicImageView.image = UIImage(named: sampleTopic.picture)
//            topicDescriptionLabel.text = sampleTopic.description
            for (i, element) in allTopics.enumerated() {
                if (allTopics[i].name == topic) {
                    topicNameLabel.text = allTopics[i].name
                    topicImageView.image = UIImage(named: allTopics[i].picture)
                    topicDescriptionLabel.text = allTopics[i].description
                }
            }
        }
        
        print(passedInTopic)
        
        // RESOURCES
        
//        let resourceLinks = NSMutableAttributedString()
//        let newline = NSMutableAttributedString(string: "\n")
//        let links = sampleTopic.links
//        for link in links {
//            let attributedString = NSMutableAttributedString(string: link)
//            let url = URL(string: link)
//            attributedString.addAttribute(.link, value: url, range: NSMakeRange(0,link.count))
//            resourceLinks.append(attributedString)
//            resourceLinks.append(newline)
//        }
//
//        topicResourceLinksLabel.attributedText = resourceLinks
        
        // PEOPLE INTERESTED IN TOPIC
        let people = sampleTopic.people
        if (people.count == 0) {
            topicInterestLabel.text = "You are the first person interested in this topic"
        } else if (people.count == 1) {
            topicInterestLabel.text = people[0] + " is also interested in this topic"
        } else if (people.count == 2) {
            topicInterestLabel.text = people[0] + " and " + people[1] + " are also interested in this topic"
        } else {
            let count = String(people.count - 2)
            topicInterestLabel.text = people[0] + ", " + people[1] + " and " + count + " others are interested in this topic"
        }
        
        // RELATED EVENTS
        let events = sampleTopic.events
        let eventsText: String
        for event in events {
            
        }
    }
    
   
    
    @IBAction func tapTopicResourceLinksLabel(_ sender: UITapGestureRecognizer) {
        print("Hello")
    }
    
    
}
