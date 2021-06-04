//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Jerry on 6/1/21.
//

import Foundation


public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageUrl: URL
    
}
