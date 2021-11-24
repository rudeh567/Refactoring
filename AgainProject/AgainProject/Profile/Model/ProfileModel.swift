//
//  ProfileModel.swift
//  AgainProject
//
//  Created by yeoboya on 2021/11/24.
//

import Foundation

struct ProfileResult: Codable {
    let photo: ProfilePhoto
    let member: Member
}

struct ProfileResponse: Codable {
    let result: ProfileResult
    let status: String
}

struct Member: Codable {
    var chat_name: String?
    let l_code: String?
    let loc: String?
    var chat_conts: String?
    let mem_sex: String?
    var mem_age: String?
    let totLikeCnt: String?
    
    enum CodingKeys: String, CodingKey {
        case chat_name
        case l_code
        case loc
        case chat_conts
        case mem_sex
        case mem_age
        case totLikeCnt
    }
}

struct Photo: Codable {
    let url: String
}

struct ProfilePhoto: Codable {
    var profile: String
    let photoList: [Photo]?
    
    enum CodingKeys: String, CodingKey {
        case profile = "defPhoto"
        case photoList = "photoList"
    }
}
