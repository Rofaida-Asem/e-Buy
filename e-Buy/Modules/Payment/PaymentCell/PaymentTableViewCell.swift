//
//  PaymentTableViewCell.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 28/06/2022.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var checkButton: CheckBoxButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
