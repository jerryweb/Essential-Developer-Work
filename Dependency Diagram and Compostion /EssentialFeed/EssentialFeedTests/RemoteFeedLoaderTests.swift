//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Jerry on 6/3/21.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func load() {
        
        client.get(fromUrl: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
        
    func get(fromUrl: URL) {}
}

class HTTPClientSpy: HTTPClient {
    
    override func get(fromUrl: URL){
        requestedURL = fromUrl
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
                
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestedDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)

    }
}
