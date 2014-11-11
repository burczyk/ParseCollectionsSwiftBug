//
//  Post.swift
//  ParseCollectionsSwiftBug
//
//  Created by Kamil Burczyk on 11.11.2014.
//  Copyright (c) 2014 Sigmapoint. All rights reserved.
//

import UIKit

class Post: PFObject, PFSubclassing {
    
    @NSManaged var message: String?
    @NSManaged var tags: [Tag]?
    
    class func parseClassName() -> String! {
        return "Post"
    }
    
}
