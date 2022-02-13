//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Sergey Kudryavtsev on 13.02.2022.
//

import XCTest

class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL
    
    init(url: URL = URL(string: "https://a-given-url.com")!, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    func load(){
        client.getDataFrom(url: url)
    }
}

protocol HTTPClient {
    func getDataFrom(url: URL)
}


class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = makeSUT().client
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestedDataFromURL() {
        let url: URL = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        XCTAssertEqual(client.requestedURL, url)
    }
    
    // MARK: - Helpers
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        return (RemoteFeedLoader(url: url, client: client), client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        
        func getDataFrom(url: URL) {
            requestedURL = url
        }
    }
}
