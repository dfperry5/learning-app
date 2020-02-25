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
    //MARK: Actions
    
    let firstTopic = TopicModel(name: "iOS", picture: "Apple_gray_logo", description: "The dopest logo", links: ["www.apple.com"], people: ["Yooo"], events: [1])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
