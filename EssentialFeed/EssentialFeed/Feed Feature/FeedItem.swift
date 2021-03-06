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
    
    public init(id: UUID, description: String?, location: String?, imageUrl: URL){
        self.id = id
        self.description = description
        self.location = location
        self.imageUrl = imageUrl
    }
}

