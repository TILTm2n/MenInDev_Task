//
//  GalleryData.swift
//  MenInDev_Test
//
//  Created by Eugene on 29.09.2022.
//

import Foundation

struct GalleryData: Codable {
    var success: Bool
    var data: [GalleryItem]
    
    enum CodingKeys: String, CodingKey {
        case success
        case data
    }
}

struct GalleryItem: Codable {
    
    var id: Int
    var title: String
    //var body: String
    var date: String
    var city: String
    var preview: Preview
    var attachments: [AttachmentItem]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        //case body
        case date
        case city
        case preview
        case attachments
    }
}

struct Preview: Codable {
    var id: Int
    var original: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case original
    }
}

struct AttachmentItem: Codable {
    var id: Int
    var original: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case original
    }
}


