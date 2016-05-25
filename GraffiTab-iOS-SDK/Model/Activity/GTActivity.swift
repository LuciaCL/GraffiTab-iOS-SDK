//
//  GTActivity.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 11/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public enum GTActivityType: String {
    case COMMENT
    case CREATE_STREAMABLE
    case FOLLOW
    case LIKE
}

public class GTActivity: Mappable {

    public var date: NSDate?
    public var type: GTActivityType?
    public var followed: GTUser?
    public var follower: GTUser?
    public var liker: GTUser?
    public var likedStreamable: GTStreamable?
    public var commenter: GTUser?
    public var commentedStreamable: GTStreamable?
    public var comment: GTComment?
    public var creator: GTUser?
    public var createdStreamable: GTStreamable?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        date <- (map["date"], CustomDateFormatTransform(formatString: GTApiDateConstants.InputFormat))
        type <- map["type"]
        followed <- map["followed"]
        follower <- map["follower"]
        liker <- map["liker"]
        likedStreamable <- map["likedStreamable"]
        commenter <- map["commenter"]
        commentedStreamable <- map["commentedStreamable"]
        comment <- map["comment"]
        creator <- map["creator"]
        createdStreamable <- map["createdStreamable"]
    }
    
    public func softCopy(other: GTActivity) {
        self.date = other.date
        self.type = other.type
        self.followed?.softCopy(other.followed!)
        self.follower?.softCopy(other.follower!)
        self.liker?.softCopy(other.liker!)
        self.likedStreamable?.softCopy(other.likedStreamable!)
        self.commenter?.softCopy(other.commenter!)
        self.commentedStreamable?.softCopy(other.commentedStreamable!)
        self.comment?.softCopy(other.comment!)
        self.creator?.softCopy(other.creator!)
        self.createdStreamable?.softCopy(other.createdStreamable!)
    }
}
