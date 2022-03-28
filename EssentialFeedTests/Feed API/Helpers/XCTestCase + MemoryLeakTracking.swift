//
//  XCTestCase + MemoryLeakTracking.swift
//  EssentialFeedTests
//
//  Created by Sergey Kudryavtsev on 28.03.2022.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instanse: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instanse] in
            XCTAssertNil(instanse, "Instanse should have been deallocated. Potential memory leak!", file: file, line: line)
        }
    }
}
