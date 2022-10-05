//
//  PostModel.swift
//  MenInDev_Test
//
//  Created by Eugene on 22.09.2022.
//

import Foundation

struct PostData: Codable {
    var success: Bool
    var data: [Post]
}

struct Post: Codable {
    var id: Int
    var title: String
    var description: String
    var publishedAt: String
    var myLike: Bool
    var likeCount: Int
    var commentCount: Int
    var media: [Media]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case publishedAt = "published_at"
        case myLike = "my_like"
        case likeCount = "likes_count"
        case commentCount = "comment_count"
        case media = "media"
    }
}

struct Media: Codable {
    var id: Int
    var original: String
    
}
