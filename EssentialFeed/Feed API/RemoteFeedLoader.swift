//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 13.02.2022.
//

import Foundation


public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error) -> Void)
}

public final class RemoteFeedLoader {
    public enum Error: Swift.Error {
        case connectivity
    }
    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL = URL(string: "https://a-given-url.com")!, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void = {_ in }){
        client.get(from: url) { error in
            completion(.connectivity)
        }
    }
}


