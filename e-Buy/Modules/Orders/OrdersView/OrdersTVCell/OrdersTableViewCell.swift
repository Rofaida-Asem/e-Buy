//
//  OrdersTableViewCell.swift
//  e-Buy
//
//  Created by Om Malikah  on 28/11/1443 AH.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
    @IBOutlet weak var orderNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
