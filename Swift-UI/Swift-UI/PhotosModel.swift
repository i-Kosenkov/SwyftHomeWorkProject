//
//  PhotosModel.swift
//  Swift-UI
//
//  Created by Ivan Kosenkov on 11.07.2023.
//

struct PhotosModel: Decodable {
    var response: Photos
}

struct Photos: Decodable {
    var item: [Photo]
}

struct Photo: Decodable {
    var id: Int
    var text: String?
    var size: [Sizes]
}

struct Sizes: Codable{
    var url: String
}
