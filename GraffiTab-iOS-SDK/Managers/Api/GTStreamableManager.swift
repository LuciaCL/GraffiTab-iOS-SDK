//
//  GTStreamableManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 08/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire

public class GTStreamableManager: NSObject {
    
    public class func getPopular(offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetPopularTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getPopular(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getNewest(offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetNewestTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getNewest(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func searchForLocation(neLatitude: Double, neLongitude: Double, swLatitude: Double, swLongitude: Double, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTSearchStreamablesForLocationTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.searchForLocation(neLatitude, neLongitude: neLongitude, swLatitude: swLatitude, swLongitude: swLongitude, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func searchForHashtag(query: String = "", offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTSearchStreamablesForHashtagTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.search(query, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func searchHashtags(query: String = "", cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTSearchHashtagsTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.search(query, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getLikers(streamableId: Int, offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetLikersTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getLikers(streamableId, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func like(streamableId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTLikeStreamableTask()
        return task.like(streamableId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func unlike(streamableId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTUnlikeStreamableTask()
        return task.unlike(streamableId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func flag(streamableId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTFlagStreamableTask()
        return task.flag(streamableId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getStreamable(streamableId: Int, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetStreamableTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.get(streamableId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getComments(streamableId: Int, offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetCommentsTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getComments(streamableId, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func postComment(streamableId: Int, text: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTPostCommentTask()
        return task.postComment(streamableId, text: text, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func deleteComment(streamableId: Int, commentId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTDeleteCommentTask()
        return task.deleteComment(streamableId, commentId: commentId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func editComment(streamableId: Int, commentId: Int, text: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTEditCommentTask()
        return task.editComment(streamableId, commentId: commentId, text: text, successBlock: successBlock, failureBlock: failureBlock)
    }
}
