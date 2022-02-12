//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 12.02.2022.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(complete: @escaping (LoadFeedResult) -> Void)
}
