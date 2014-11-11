###Probable bug in Swift and Parse-iOS-SDK 1.5.0
I have a Swift project where I pin some data to `PFUser` object. It is an array of `PFObject` subclasses:

```swift
PFUser.currentUser()["posts"] = [post1, post2]
```

When I try to fetch all the data and cast it to Swift Array it crashes with `fatal error: NSArray element failed to match the Swift Array Element type` error. 

```swift
func printCurrentPosts() {
    let posts = PFUser.currentUser()["posts"] as [Post]
    println("posts: \(posts)") //crashes
}
```

When I cast it to general `[PFObject]` array it works and prints its content properly. 

```swift
func printCurrentPostsAsPFObjectArray() {
    let posts = PFUser.currentUser()["posts"] as [PFObject]
    println("posts: \(posts)") //works
}
```

When I fetch the data in `saveAllInBackground:` completion closure it can be casted to subclass array without error:

```swift
PFObject.saveAllInBackground([post1, post2, PFUser.currentUser()], block: { (success, error) -> Void in
    let posts = PFUser.currentUser()["posts"] as [Post]
    println("posts: \(posts)") //works
})
```

See [ViewController.swift](https://github.com/burczyk/ParseCollectionsSwiftBug/blob/master/ParseCollectionsSwiftBug/ViewController.swift) file for implementation. You can run this project in simulator to check each variant.

Using Parse SDK 1.5.0

What am I doing wrong?