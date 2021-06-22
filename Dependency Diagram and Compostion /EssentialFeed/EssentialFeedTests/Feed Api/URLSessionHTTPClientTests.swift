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
        session.dataTask(with: url) { _, _, _ in }.resume()
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
    
    func test_getFromURL_resumesDataTaskWithURL() {
        let url = URL(string: "https://any-url.com")!
        let session = URLSessionSpy()
        let task = URLSessionDataTaskSpy()
        session.stub(url: url, task: task)
        
        let sut = URLSessionHTTPClient(session: session)
        sut.get(from: url)
        XCTAssertEqual(task.resumeCallCount, 1)
    }
    
    
    // MARK: - Helpers
    
    private class URLSessionSpy: URLSession {
        var recievedURLs = [URL]()
        private var stubs = [URL: FakeURLSessionDataTask]()
        
        func stub(url: URL, task: FakeURLSessionDataTask){
            stubs[url] = task
        }
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            recievedURLs.append(url)
            
            return stubs[url] ?? FakeURLSessionDataTask()
        }
    
    }

    private class FakeURLSessionDataTask: URLSessionDataTask {
        override func resume() {
        }
        
    }
    private class URLSessionDataTaskSpy: FakeURLSessionDataTask {
        var resumeCallCount = 0
        
        override func resume() {
            resumeCallCount += 1
        }
    }
    
}
