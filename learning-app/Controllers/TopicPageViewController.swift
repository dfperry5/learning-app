//
//  TopicPageViewController.swift
//  learning-app
//
//  Created by Dylan Perry on 2/25/20.
//  Copyright © 2020 Beat Team. All rights reserved.
//

import UIKit

class TopicPageViewController: UIViewController {

    // HEADING OUTLETS
    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var topicImageView: UIImageView!
    @IBOutlet weak var topicDescriptionLabel: UILabel!
    
    // RESOURCE OUTLETS
    @IBOutlet weak var topicResourcesLabel: UILabel!
    @IBOutlet weak var topicResourcesLinksButton: UIButton!
    
    // INTEREST OUTLET
    @IBOutlet weak var topicInterestLabel: UILabel!
    
    // EVENTS OUTLETS
    @IBOutlet weak var topicEventsHeadingLabel: UILabel!
    @IBOutlet weak var topicEventsLabel: UILabel!
    
    let sampleTopic = TopicModel(name: "iOS Developement", picture: "Apple_gray_logo", description: "For those interested in learning more about making an iOS app for iPhones! This is the best topic, you should learn this for sure", links: ["http://www.apple.com"], people: ["Beth","Kelsey","Dylan","Priya","Chris","Paul","Devon"], events: [EventModel(name: "iOS Training Camp", date: Date(), location: "MMK Innovation Garage", description: "Come learn iOS with the best team ever!", links: []), EventModel(name: "AWS", date: Date(), location: "NMW Apex 1", description: "Learn AWS from ECS experts on the topic", links: [])])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // HEADING
        topicNameLabel.text = sampleTopic.name
        topicImageView.image = UIImage(named: sampleTopic.picture)
        topicDescriptionLabel.text = sampleTopic.description
        
        // RESOURCES
        topicResourcesLinksButton.setTitle(sampleTopic.links[0], for: .normal)
        
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
        var allEvents = String()
        for event in events {
            let eventString = event.name + " on 2/25/2020 in " + event.location + ": " + event.description + "\n\n"
            allEvents = allEvents + eventString
        }
        
        topicEventsLabel.text = allEvents
        topicEventsLabel.sizeToFit()
        
    }
    
    // RESOURCE BUTTONS
    @IBAction func tapTopicResourcesLinkButton(_ sender: UIButton) {
        let url = URL(string: sampleTopic.links[0])
        if let url = NSURL(string: sampleTopic.links[0]){
            UIApplication.shared.openURL(url as URL)
        }
    }
    
}
