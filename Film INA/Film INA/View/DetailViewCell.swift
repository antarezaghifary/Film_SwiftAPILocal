//
//  DetailViewCell.swift
//  Film INA
//
//  Created by 247 on 13/08/19.
//  Copyright © 2019 247. All rights reserved.
//

import UIKit

class DetailViewCell: UICollectionViewCell {
    @IBOutlet weak var judulDet: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var genreDet: UILabel!
    @IBOutlet weak var rilisDet: UILabel!
    @IBOutlet weak var descDet: UILabel!
    
    @IBOutlet weak var reviewDet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
