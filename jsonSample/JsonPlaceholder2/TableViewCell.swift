//
//  TableViewCell.swift
//  JsonPlaceholder2
//
//  Created by Sundir Talari on 24/05/18.
//  Copyright © 2018 Sundir Talari. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var ImageViewObject: UIImageView!
    
    @IBOutlet weak var LabelViewObject: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
