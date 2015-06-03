//
//  SocialMedia.swift
//  TableViewDemo
//
//  Created by Ravi Shankar on 03/06/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

struct SocialMedia {
    
    var name:String
    var imageName:String
    var image: UIImage {
        get {
            return UIImage(named: imageName)!
        }
    }
    
}
