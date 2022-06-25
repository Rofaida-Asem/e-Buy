//
//  BrandsCollectionViewCell.swift
//  e-Buy
//
//  Created by Om Malikah  on 22/11/1443 AH.
//

import UIKit

class BrandsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var brandNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        brandImageView.layer.cornerRadius = 10.0
        brandImageView.layer.borderColor = UIColor.purple.cgColor
        brandImageView.layer.borderWidth = 1.0
    }

}
