//
//  DetailViewController.swift
//  TableViewDemo
//
//  Created by Ravi Shankar on 03/06/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var socialMedia: SocialMedia?
    var index:Int?
    
    @IBOutlet var textFeild:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = socialMedia?.name {
            textFeild?.text = name
        }
    }
    
    // MARK:- PrepareForSegue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let name = textFeild?.text
        if var socialMedia = socialMedia {
            self.socialMedia?.name = name!
        } else {
            socialMedia = SocialMedia(name:name!,imageName:"unknown")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
