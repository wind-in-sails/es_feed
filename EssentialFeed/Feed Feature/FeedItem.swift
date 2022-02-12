//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 12.02.2022.
//

import Foundation

struct FeedItem {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
