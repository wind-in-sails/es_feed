//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Sergey Kudryavtsev on 13.02.2022.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = makeSUT().client
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let url: URL = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        XCTAssertEqual(client.requestedURL, url)
    }
    
    func test_loadTwice_requestsDataFromURLTwice() {
        let url: URL = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        sut.load()
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    // MARK: - Helpers
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        return (RemoteFeedLoader(url: url, client: client), client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        var requestedURLs: [URL] = []
        
        func getDataFrom(url: URL) {
            requestedURL = url
            requestedURLs.append(url)
        }
    }
}
