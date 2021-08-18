//
//  ListImage.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import UIKit
import SwiftyJSON

struct ListImage {
    var anh: String
}

extension ListImage: Decodable {
    enum ListImageCodingKeys: String, CodingKey {
        case anh
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ListImageCodingKeys.self)
        
        anh = try container.decode(String.self, forKey: .anh)
    }
}
