//
//  ChapTableViewCell.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import UIKit

class ChapTableViewCell: UITableViewCell {
    @IBOutlet weak var chapterLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var listDetail: ModelDetail?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillData() {
        chapterLabel.text = listDetail?.tenTruyen
        dateLabel.text = listDetail?.ngaynhap
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
