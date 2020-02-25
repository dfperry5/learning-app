//
//  TopicModel.swift
//  learning-app
//
//  Created by Dylan Perry on 2/25/20.
//  Copyright © 2020 Beat Team. All rights reserved.
//

import Foundation

struct TopicModel {
    var name: String // This is the key for the map
    var picture: String
    var description: String
    var links: [String]
    var people: [String]
    var events: [Any]
}
