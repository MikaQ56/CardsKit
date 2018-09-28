//
//  PostCell.swift
//  CardsKit
//
//  Created by Mickael on 28/09/2018.
//  Copyright © 2018 Mickael. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialCards

class PostCell: MDCCardCollectionCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var pseudoLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    static let cellHeight: CGFloat = 100.0
    static let cellPadding: CGFloat = 8.0
    
    var post: Post? {
        didSet {
            guard let post = post else {
                return
            }
            pseudoLabel.text = post.username
            messageLabel.text = post.message
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //layer.shouldRasterize = true
        //layer.rasterizationScale = UIScreen.main.scale
        clipsToBounds = false
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pseudoLabel.text = nil
        messageLabel.text = nil
    }
}
