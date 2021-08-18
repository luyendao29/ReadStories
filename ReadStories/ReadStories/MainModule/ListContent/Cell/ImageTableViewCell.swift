//
//  ImageTableViewCell.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import UIKit
import Kingfisher

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var images: UIImageView!
    
    var list: ListImage?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillData() {
        if let list = list {
            let url = URL(string: list.anh)
            self.images.kf.setImage(with: url)
        }
    }
}
