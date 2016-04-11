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
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = GTDateConstants.InputFormat
        
        isRead <- map["isRead"]
        date <- (map["date"], DateFormatterTransform(dateFormatter: dateFormatter))
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
}
