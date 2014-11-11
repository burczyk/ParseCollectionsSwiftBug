//
//  Tag.swift
//  ParseCollectionsSwiftBug
//
//  Created by Kamil Burczyk on 11.11.2014.
//  Copyright (c) 2014 Sigmapoint. All rights reserved.
//

import UIKit

class Tag: PFObject, PFSubclassing {
    @NSManaged var name: String?
    
    class func parseClassName() -> String! {
        return "Tag"
    }
}
