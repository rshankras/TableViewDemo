//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Ravi Shankar on 02/06/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class TableViewDemoController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var data:[SocialMedia] = [SocialMedia]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- TabvleView dataSource methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as! UITableViewCell
        
        let socialMedia = data[indexPath.row]
        
        cell.textLabel?.text = socialMedia.name
        cell.imageView?.image = socialMedia.image
        
        return cell
    }

    
    // MARK:- TabvleView Delegate methods
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            // remove the deleted item from the model
            data.removeAtIndex(indexPath.row)
            
            // remove the deleted item from the `UITableView`
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            return
        }
        
    }
    
    //MARK:- TableViewCell Move row methods
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView,
        moveRowAtIndexPath sourceIndexPath: NSIndexPath,
        toIndexPath destinationIndexPath: NSIndexPath) {
            let val = data.removeAtIndex(sourceIndexPath.row)
            data.insert(val, atIndex: destinationIndexPath.row)
    }
    
    //MARK:- Populate data
    
    func loadData() -> [SocialMedia] {
        
        data.append(SocialMedia(name:"Evernote",imageName:"evernote"))
        data.append(SocialMedia(name:"Facebook",imageName:"facebook"))
        data.append(SocialMedia(name:"GitHub",imageName:"github"))
        data.append(SocialMedia(name:"Google",imageName:"google"))
        data.append(SocialMedia(name:"LinkedIn",imageName:"linkedin"))
        data.append(SocialMedia(name:"Paypal",imageName:"paypal"))
        data.append(SocialMedia(name:"Pinterest",imageName:"pinterest"))
        data.append(SocialMedia(name:"Twitter",imageName:"twitter"))
        data.append(SocialMedia(name:"Vimeo",imageName:"vimeo"))
        data.append(SocialMedia(name:"youtube",imageName:"YouTube"))
        
        return data
    }
    
    //MARK:- Prepare Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editAction" {
            let cell = sender as! UITableViewCell
            let selectedRow = tableView.indexPathForCell(cell)?.item
            let detailViewController:DetailViewController = segue.destinationViewController as! DetailViewController
            
            detailViewController.index = selectedRow
            detailViewController.socialMedia = data[selectedRow!]
        }
    }
    
    //MARK:- Cancel and Done
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        // do nothing
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        
        let detailViewController = segue.sourceViewController as! DetailViewController
        let socialMedia = detailViewController.socialMedia
        if let selectedIndex = detailViewController.index {
            data[selectedIndex] = socialMedia!
        } else {
            data.append(socialMedia!)
        }
        tableView.reloadData()
    }
    
    //MARK:- Editing toggle
    
    @IBAction func startEditing(sender: UIBarButtonItem) {
        tableView.editing = !tableView.editing
    }
}

