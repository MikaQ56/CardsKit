//
//  ViewController.swift
//  CardsKit
//
//  Created by Mickael on 28/09/2018.
//  Copyright © 2018 Mickael. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialCards
import MaterialComponents.MaterialButtons

class ViewController: UIViewController {
    
    let postService = PostService()
    var posts = [Post]()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var postButton: MDCFloatingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = postService.posts
        let cellNib = UINib(nibName: "PostCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "PostCell")
        collectionView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as? PostCell {
            cell.post = posts[indexPath.row]
            //cell.isSelectable = true
            cell.cornerRadius = 8
            cell.setShadowElevation(ShadowElevation(rawValue: 6), for: .selected)
            cell.setShadowColor(UIColor.black, for: .highlighted)
            return cell
        } else {
            fatalError("Missing cell for indexPath: \(indexPath)")
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - (PostCell.cellPadding * 2), height: PostCell.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: PostCell.cellPadding, left: PostCell.cellPadding, bottom: PostCell.cellPadding, right: PostCell.cellPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return PostCell.cellPadding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}

