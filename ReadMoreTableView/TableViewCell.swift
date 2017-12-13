//
//  TableViewCell.swift
//  ReadMoreTableView
//
//  Created by Nitin Bhatia on 13/12/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnReadMore: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
