//
//  HomeViewModel.swift
//  e-Buy
//
//  Created by Om Malikah  on 23/11/1443 AH.
//

import Foundation

class HomeViewModel {
    
    var Products: [Product]?{
        didSet{
            bindingResult()
        }
    }
    
    var bindingResult: (()->()) = {}
    init(serviece:ApiService){
        
    }
    
    func getData(){
        
        DispatchQueue.global().async {
            
            let url = Constants.getProducts_URL()
            
            ApiService.shared.getData(url: url) { [weak self] (result : Products?, error) in
                if let error = error {
                    print(error)
                }else{
                    guard let results = result else { return }
                    self?.Products = results.products
                }
            }
        }
    }
}
