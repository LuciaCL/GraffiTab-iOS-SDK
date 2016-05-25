//
//  GTNotification.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 11/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public enum GTNotificationType: String {
    case COMMENT
    case FOLLOW
    case LIKE
    case MENTION
    case WELCOME
}

public class GTNotification: Mappable {

    public var isRead: Bool?
    public var date: NSDate?
    public var type: GTNotificationType?
    public var follower: GTUser?
    public var liker: GTUser?
    public var likedStreamable: GTStreamable?
    public var commenter: GTUser?
    public var commentedStreamable: GTStreamable?
    public var comment: GTComment?
    public var mentioner: GTUser?
    public var mentionedStreamable: GTStreamable?
    public var mentionedComment: GTComment?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        isRead <- map["isRead"]
        date <- (map["date"], CustomDateFormatTransform(formatString: GTApiDateConstants.InputFormat))
        type <- map["type"]
        follower <- map["follower"]
        liker <- map["liker"]
        likedStreamable <- map["likedStreamable"]
        commenter <- map["commenter"]
        commentedStreamable <- map["commentedStreamable"]
        comment <- map["comment"]
        mentioner <- map["mentioner"]
        mentionedStreamable <- map["mentionedStreamable"]
        mentionedComment <- map["mentionedComment"]
    }
    
    public func softCopy(other: GTNotification) {
        self.isRead = other.isRead
        self.date = other.date
        self.type = other.type
        self.follower?.softCopy(other.follower!)
        self.liker?.softCopy(other.liker!)
        self.likedStreamable?.softCopy(other.likedStreamable!)
        self.commenter?.softCopy(other.commenter!)
        self.commentedStreamable?.softCopy(other.commentedStreamable!)
        self.comment?.softCopy(other.comment!)
        self.mentioner?.softCopy(other.mentioner!)
        self.mentionedStreamable?.softCopy(other.mentionedStreamable!)
        self.mentionedComment?.softCopy(other.mentionedComment!)
    }
}
