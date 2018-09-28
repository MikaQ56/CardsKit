//
//  Item.swift
//  CardsKit
//
//  Created by Mickael on 28/09/2018.
//  Copyright © 2018 Mickael. All rights reserved.
//

import Foundation

class Post {
    
    let username: String
    let avatar: String
    let message: String
    
    init(username: String, avatar: String, message: String) {
        self.username = username
        self.avatar = avatar
        self.message = message
    }
}
