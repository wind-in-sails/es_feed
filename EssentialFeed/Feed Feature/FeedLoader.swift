//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 12.02.2022.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
