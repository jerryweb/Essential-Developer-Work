//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jerry on 6/1/21.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
