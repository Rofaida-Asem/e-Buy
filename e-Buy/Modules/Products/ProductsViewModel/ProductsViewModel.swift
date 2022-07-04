//
//  ProductsViewModel.swift
//  e-Buy
//
//  Created by Om Malikah  on 25/11/1443 AH.
//

import Foundation

class ProductsViewModel {
    // var vendor :String!
    var searchText:String?
    var products: [Product]?{
        didSet{
            bindingResult()
 
        }
    }
    var filterData:[Product]?{
        didSet{
            bindingFilterResult()
        }
    }
    var bindingResult: (()->()) = {}
    var bindingFilterResult: (()->()) = {}
    init(serviece:ApiService){
        // self.vendor = vendor
    }
    
    func getData(forBrand brand: String){
        
        DispatchQueue.global().async {
            
            let url = Constants.getProducts_URL()
            print(url)
            ApiService.shared.getData(url: url) { [weak self] (result : Products?, error) in
                if let error = error {
                    print(error)
                }else{
                    guard let results = result else { return }
                    self?.products = results.products?.filter({$0.vendor == brand})
                    
                    self?.filterData = self?.products
                    print(self?.products)
                }
            }
        }
    }
    
    func filterBYPrice(numb:Float){
        if numb == 0 {
            filterData = products
        }else{
            filterData = products?.filter({Float(($0.variants?.first?.price)! ) ?? 0.0 <= numb })
        }
    }
  
    func filter(searchText:String){
 
        if searchText == "" {
            filterData = products
        }else{
            filterData = products?.filter({$0.title?.uppercased().contains(searchText.uppercased()) ?? false} )
        }
    }
    }
    
 
