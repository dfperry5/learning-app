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
    @IBOutlet weak var topicResourceLinksLabel: UILabel!
    
    @IBOutlet weak var topicInterestLabel: UILabel!
    
    @IBOutlet weak var topicEventsHeadingLabel: UILabel!
    @IBOutlet weak var topicEventsLabel: UILabel!
    
    
    
    
    let firstTopic = TopicModel(name: "iOS", picture: "Apple_gray_logo", description: "The dopest logo", links: ["www.apple.com"], people: [], events: [1])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topicNameLabel.text = firstTopic.name
        topicImageView.image = UIImage(named: firstTopic.picture)
        topicDescriptionLabel.text = firstTopic.description
        // need to do links and events still
        let people = firstTopic.people
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
        
    }
}
