//
//  ProfileModel.swift
//  MenInDev_Test
//
//  Created by Eugene on 03.10.2022.
//

import Foundation

struct User: Codable {
    var success: Bool
    var data: UserInfo
}

struct UserInfo: Codable {
    var user: UserData
    var socialNetwork: SocialNetwork
}

struct UserData: Codable {
    var id: Int
    var name: String
    var phone: String
    var code: Int
    var email: String
    var firstName: String
    var lastName: String?
    var roleId: Int
    var avatar: Avatar
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case phone = "phone"
        case code = "code"
        case email = "email"
        case firstName = "firstName"
        case lastName = "lastname"
        case roleId = "role_id"
        case avatar = "avatar"
    }
}

struct Avatar: Codable {
    var id: Int
    var original: String
}

struct Role {
    var id: Int
    var name: String
}

struct SocialNetwork: Codable {
    var ya: String
    var vk: String
    var tg: String
    var yt: String
    var tt: String
}
