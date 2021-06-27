//
//  XCTestCase+MemoryLeakTrackig.swift
//  EssentialFeedTests
//
//  Created by Jerry on 6/23/21.
//

import XCTest

extension XCTestCase {
     func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocate. Potential memory leak.", file: file, line: line)
        }
        
    }
}
