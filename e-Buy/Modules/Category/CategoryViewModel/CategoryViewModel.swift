//
//  CategoryViewModel.swift
//  e-Buy
//
//  Created by Om Malikah  on 25/11/1443 AH.
//

import Foundation

class CategoryViewModel {
    // var vendor :String!
    var product: [Product]?{
        didSet{
            bindingResultProducts()
        }
    }
    
    var custemCollection: [CustomCollection]?{
        didSet{
            bindingCustomCollection()
        }
    }
    
    var bindingResultProducts: (()->()) = {}
    var bindingCustomCollection: (()->()) = {}
    init(serviece:ApiService){
        // self.vendor = vendor
    }
    
    func getData(){
        
        DispatchQueue.global().async {
            
            let url = Constants.getProducts_URL()
            ApiService.shared.getData(url: url) { [weak self] (results : Products?, error) in
                if let error = error {
                    print(error)
                }else{
                    guard let results = results else { return }
                    self?.product = results.products
                    
                }
            }
            
        }
    }
    
    func getMainCategory(){
        
        DispatchQueue.global().async {
            
            let customCollectionUrl = Constants.getCustomCollection_URL()
            print(customCollectionUrl)
            ApiService.shared.getData(url: customCollectionUrl) { [weak self] (result : MainCategory?, error) in
                if let error = error {
                    print(error)
                }else{
                    guard let results = result else { return }
                    self?.custemCollection = results.customCollections
                    print(results)
                }
            }
        }
    }
}

