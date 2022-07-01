//
//  UIImageExtention.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 29/06/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView{
    func setImage(with url : String){
        guard let url = URL(string: url) else { return }
        let placeHolderImage = UIImage(named: "Adidas")
        kf.indicatorType = .activity
        self.kf.setImage(with: url, placeholder: placeHolderImage, options: [.transition(.fade(1))])
    }
}
