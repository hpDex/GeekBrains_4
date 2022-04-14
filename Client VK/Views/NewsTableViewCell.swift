//
//  NewsTableViewCell.swift
//  Client VK
//
//  Created by Denis Filippov on 21.02.2022.
//  Copyright © 2022 Vasily Petuhov. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarUserNews: AvatarsView!
    @IBOutlet weak var nameUserNews: UILabel!
    @IBOutlet weak var dateNews: UILabel!
    @IBOutlet weak var textNews: UILabel!
    @IBOutlet weak var textNewsPost: UITextView!
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var likesCount: LikeControl!
    @IBOutlet weak var commentsCount: UIButton!
    @IBOutlet weak var repostsCount: UIButton!
    @IBOutlet weak var viewsCount: UIButton!
    
}
