//
//  ProductsViewModel.swift
//  e-Buy
//
//  Created by Om Malikah  on 25/11/1443 AH.
//

import Foundation

class ProductsViewModel {
    // var vendor :String!
    var products: [Product]?{
        didSet{
            bindingResult()
        }
    }
    
    var bindingResult: (()->()) = {}
    init(serviece:ApiService){
        // self.vendor = vendor
    }
    
    func getData(forBrand brand: String){
        
        DispatchQueue.global().async {
            
            let url = Constants.getProducts_URL()
            
            ApiService.shared.getData(url: url) { [weak self] (result : Products?, error) in
                if let error = error {
                    print(error)
                }else{
                    guard let results = result else { return }
                    self?.products = results.products?.filter({$0.vendor == brand})
                    
                }
            }
        }
    }
}
