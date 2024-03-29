//
//  GroupsModel.swift
//  Swift-UI
//
//  Created by Ivan Kosenkov on 11.07.2023.
//

struct GroupsModel: Decodable {
    var response: Groups
}

struct Groups: Decodable {
    var item: [Group]
}

struct Group: Codable {
    var id: Int
    var name: String?
    var photo: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_50"
        case description
    }
}
