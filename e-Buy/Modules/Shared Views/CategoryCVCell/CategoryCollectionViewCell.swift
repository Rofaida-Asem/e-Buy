//
//  CategoryCollectionViewCell.swift
//  e-Buy
//
//  Created by Om Malikah  on 22/11/1443 AH.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favotiteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryImageView.layer.borderWidth = 2
        categoryImageView.layer.cornerRadius = 20.0
        categoryImageView.layer.borderColor = UIColor.purple.cgColor
        priceLabel.textColor = .purple
    }

}
