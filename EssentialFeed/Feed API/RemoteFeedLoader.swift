//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 13.02.2022.
//

import Foundation

public final class RemoteFeedLoader: FeedLoader {
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = LoadFeedResult<Error>

    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL = URL(string: "https://a-given-url.com")!, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void){
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case let .success(data, response):
                completion(FeedItemsMapper.map(data: data, response: response))
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
}

