//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 13.02.2022.
//

import Foundation


public protocol HTTPClient {
    func getDataFrom(url: URL)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL = URL(string: "https://a-given-url.com")!, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(){
        client.getDataFrom(url: url)
    }
}


