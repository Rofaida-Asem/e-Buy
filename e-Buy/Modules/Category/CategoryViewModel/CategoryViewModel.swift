//
//  CategoryViewModel.swift
//  e-Buy
//
//  Created by Om Malikah  on 25/11/1443 AH.
//

import Foundation

class CategoryViewModel {
    let defaults = UserDefaults.standard
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
    
    var subProducets: [Product]?{
        didSet{
            bindingSubCategories()
        }
    }
    
    var bindingResultProducts: (()->()) = {}
    var bindingCustomCollection: (()->()) = {}
    var bindingSubCategories: (()->()) = {}
    init(serviece:ApiService){
        
    }
    
    func getData(byCollectionId id: Int){
        
        DispatchQueue.global().async {
            
            let url = Constants.getMinCategory_URL(collectionId: id)
            ApiService.shared.getData(url: url) { [weak self] (results : Products?, error) in
                if let error = error {
                    print(error)
                }else{
                    guard let results = results else { return }
                    self?.product = results.products
                    print(results)
                }
            }
            
        }
    }
    
    
    func ISLogin() ->Bool {
        
    return defaults.bool(forKey: "userID")
        
        
    }
    
    func getMainCategory(){
        
        DispatchQueue.global().async {
            
            let url = Constants.getCustomCollection_URL()
            
            ApiService.shared.getData(url: url) { [weak self] (result : MainCategory?, error) in
                if let error = error {
                    print(error)
                }else{
                    guard let results = result else { return }
                    self?.custemCollection = results.customcollections
                   
                }
            }
        }
    }
    
    func getSubCategory(byProductType currentType: String){
        DispatchQueue.global().async {
            
            let url = Constants.getProducts_URL()
            ApiService.shared.getData(url: url) { [weak self] (results : Products?, error) in
                if let error = error {
                    print(error)
                }else{
                    guard let results = results else { return }
                    self?.product = results.products?.filter({$0.productType == currentType})
//                    let subCategories = Set(results.products?.compactMap({$0.productType}) ?? [])
//                    print(subCategories)
                }
            }
            
        }
    }
}

