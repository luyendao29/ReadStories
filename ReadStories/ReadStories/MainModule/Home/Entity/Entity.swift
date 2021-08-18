//
//  Entity.swift
//  ReadStories
//
//  Created by Boss on 16/08/2021.
//

import UIKit
import SwiftyJSON

struct ListBook {
    var id: String
    var tenTruyen: String
    var tenChap: String
    var linkAnh: String
}

extension ListBook: Decodable {
    enum ListBookCodingKeys: String, CodingKey {
        case id
        case tenTruyen
        case tenChap
        case linkAnh
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ListBookCodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        tenTruyen = try container.decode(String.self, forKey: .tenTruyen)
        tenChap = try container.decode(String.self, forKey: .tenChap)
        linkAnh = try container.decode(String.self, forKey: .linkAnh)
    }
}
