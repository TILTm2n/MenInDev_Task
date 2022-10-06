//
//  Model.swift
//  MenInDev_Test
//
//  Created by Eugene on 06.10.2022.
//

import Foundation

struct StoryData: Codable {
    var success: Bool
    var data: [Story]
}

struct Story: Codable {
    var id: Int
    var title: String
    var stories: [StoryItem]
    var media: Media?
}

struct StoryItem: Codable {
    var backgroundImage: String
    var title: String
    var body: String?
}
