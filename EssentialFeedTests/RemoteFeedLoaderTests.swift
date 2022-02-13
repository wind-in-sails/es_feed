//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Sergey Kudryavtsev on 13.02.2022.
//

import XCTest

class RemoteFeedLoader {
    func load(){
        HTTPClient.shared.getDataFrom(url: URL(string: "https://eree.com/ee.json")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    
    func getDataFrom(url: URL) {
        
    }
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    override func getDataFrom(url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestedDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        sut.load()
        XCTAssertNotNil(client.requestedURL)
    }
}
