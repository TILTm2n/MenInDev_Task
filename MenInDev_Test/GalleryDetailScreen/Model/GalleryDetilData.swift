//
//  GalleryDetilData.swift
//  MenInDev_Test
//
//  Created by Eugene on 30.09.2022.
//

import Foundation

struct GalleryDetailData: Codable {
    var success: Bool
    var data: GalleryItem
    
    enum CodingKeys: String, CodingKey {
        case success
        case data
    }
}

