//
//  Model.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import Foundation

struct ModelDetail {
    var id: String
    var tenTruyen: String
    var ngaynhap: String
}

extension ModelDetail: Decodable {
    enum ModelCodingKeys: String, CodingKey {
        case id
        case tenTruyen
        case ngaynhap
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ModelCodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        tenTruyen = try container.decode(String.self, forKey: .tenTruyen)
        ngaynhap = try container.decode(String.self, forKey: .ngaynhap)
    }
}
