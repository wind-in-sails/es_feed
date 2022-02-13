//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Sergey Kudryavtsev on 13.02.2022.
//

import XCTest

class RemoteFeedLoader {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load(){
        client.getDataFrom(url: URL(string: "https://eree.com/ee.json")!)
    }
}

protocol HTTPClient {
    func getDataFrom(url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    func getDataFrom(url: URL) {
        requestedURL = url
    }
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
