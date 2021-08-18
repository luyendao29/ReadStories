//
//  CollectionViewCell.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contenView: UIView!
    @IBOutlet weak var witdhImageContrain: NSLayoutConstraint!
    
    var listbook: ListBook?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        contenView.layer.cornerRadius = 16
        contenView.layer.shadowColor = UIColor.yellow.cgColor
        contenView.layer.shadowOpacity = 0.8
        contenView.layer.shadowOffset = .zero
        contenView.layer.shadowRadius = 16
        
    }
    
    func fillData() {
        let url = URL(string: listbook?.linkAnh ?? "")
        self.imageView.kf.setImage(with: url)
        self.nameLabel.text = listbook?.tenTruyen ?? ""
    }
    
}
