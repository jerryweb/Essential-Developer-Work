//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by Jerry on 6/16/21.
//

import XCTest

class URLSessionHTTPClient {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
     func get(from url: URL){
        session.dataTask(with: url) { _, _, _ in }
    }
}

class URLSessionHTTPClientTests: XCTestCase {
    
    func test_getFromURL_createdDataTaskWithURL() {
        let url = URL(string: "https://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)
        sut.get(from: url)
        XCTAssertEqual(session.recievedURLs, [url])
    }
    
    
    // MARK: - Helpers
    
    private class URLSessionSpy: URLSession {
        var recievedURLs = [URL]()
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            recievedURLs.append(url)
            
            return FakeURLSessionDataTask()
        }
    
    }

    private class FakeURLSessionDataTask: URLSessionDataTask {
        
    }
    
}
