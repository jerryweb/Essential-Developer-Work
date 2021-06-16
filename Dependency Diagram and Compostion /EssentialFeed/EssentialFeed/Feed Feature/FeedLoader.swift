//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jerry on 6/1/21.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
