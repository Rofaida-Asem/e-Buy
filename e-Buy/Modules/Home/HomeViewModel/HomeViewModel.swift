//
//  HomeViewModel.swift
//  e-Buy
//
//  Created by Om Malikah  on 23/11/1443 AH.
//

import Foundation

class HomeViewModel {
    
    var Product: [Product]?{
        didSet{
            bindingResult()
        }
    }
    
    var bindingResult: (()->()) = {}
    
    
}
