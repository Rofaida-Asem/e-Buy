//
//  AdsCollectionViewCell.swift
//  e-Buy
//
//  Created by Om Malikah  on 22/11/1443 AH.
//

import UIKit

class AdsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var adsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        adsImageView.layer.cornerRadius = 8
        adsImageView.contentMode = .scaleAspectFill
        // Initialization code
    }

}
