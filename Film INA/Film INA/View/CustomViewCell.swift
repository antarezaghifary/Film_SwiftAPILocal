//
//  CustomViewCell.swift
//  Film INA
//
//  Created by 247 on 19/08/19.
//  Copyright © 2019 247. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {
    @IBOutlet weak var judulLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var epiLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
