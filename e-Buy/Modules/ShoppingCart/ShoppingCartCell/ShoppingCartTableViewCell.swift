//
//  ShoppingCartTableViewCell.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 27/06/2022.
//

import UIKit
import Kingfisher

class ShoppingCartTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var describtionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBAction func stepper(_ sender: UIStepper) {
        amountLabel.text = String(sender.value)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    func configureCell(cell:CartItem){
        self.describtionLabel.text = cell.name
        self.cashLabel.text = cell.price
        self.productImageView.setImage(with: "\(cell.imgUrl)")
        self.amountLabel.text = cell.qty
    }
    
}
