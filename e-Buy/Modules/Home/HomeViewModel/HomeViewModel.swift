//
//  HomeViewModel.swift
//  e-Buy
//
//  Created by Om Malikah  on 23/11/1443 AH.
//

import Foundation

class HomeViewModel {
    let defaults = UserDefaults.standard
    var brands: [SmartCollection]?{
        didSet{
            bindingResult()
        }
    }
    
    var bindingResult: (()->()) = {}
    init(serviece:ApiService){
        
    }
    
    func ISLogin() ->Bool {
        
    return defaults.bool(forKey: "userID")
        
        
    }
    func getData(){
        
        DispatchQueue.global().async {
            
            let url = Constants.getBrands_URL()
           
            ApiService.shared.getData(url: url) { [weak self] (result : Brands?, error) in
                if let error = error {
                    print(error)
                }else{
                    guard let results = result else { return }
                    self?.brands = results.smartcollections
                }
            }
        }
    }
}
