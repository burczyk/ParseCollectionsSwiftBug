//
//  ViewController.swift
//  ParseCollectionsSwiftBug
//
//  Created by Kamil Burczyk on 11.11.2014.
//  Copyright (c) 2014 Sigmapoint. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // This doesn't work
        printCurrentPosts()
        
        //This works
//        printCurrentPostsAsPFObjectArray()
        
        //This works (the same as first method but casting is done in completion clojure)
//        addSomePostsForUser()
    }
    
    func printCurrentPosts() {
        let posts = PFUser.currentUser()["posts"] as [Post]
        println("posts: \(posts)")
    }
    
    func printCurrentPostsAsPFObjectArray() {
        let posts = PFUser.currentUser()["posts"] as [PFObject]
        println("posts: \(posts)")
    }
    
    func addSomePostsForUser() {
        let tag1 = Tag()
        tag1.name = "Computers"
        
        let tag2 = Tag()
        tag2.name = "Programming"
        
        let post1 = Post()
        post1.message = "Swift is cool."
        post1.tags = [tag1, tag2]
        
        let post2 = Post()
        post2.message = "Parse is not."
        post2.tags = [tag1, tag2]
        
        PFUser.enableAutomaticUser()
        PFUser.currentUser()["posts"] = [post1, post2]
        
        PFObject.saveAllInBackground([tag1, tag2, post1, post2, PFUser.currentUser()], block: { (success, error) -> Void in
            let posts = PFUser.currentUser()["posts"] as [Post]
            println("posts: \(posts)")
        })
    }
}

