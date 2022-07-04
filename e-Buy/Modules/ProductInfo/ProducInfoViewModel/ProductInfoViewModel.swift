//
//  ProductInfoViewModel.swift
//  e-Buy
//
//  Created by salah waleed on 04/07/2022.
//

import Foundation
let defaults = UserDefaults.standard
class ProductInfoViewModel {
    var productInfo:Productt?{
        didSet{
            bindingResult()
        }
    }
    var id :Int?
var bindingResult:(()->()) = {}
    init(id:Int){
        self.id = id
        get()
    }
    func ISLogin() ->Bool {
        
    return defaults.bool(forKey: "userID")
        
        
    }
    
    func get(){
        let request = ApiRequest()
        request.url = Constants.getOneProduct(id: id ?? 0)
      
        request.headers = Constants.headers
        request.paramters = nil
       
        ApiService.shared.getApi(request: request) { (err, response: Singleproduct?) in
            if err != nil {
                print(err ?? "")
            }else{
                guard let result = response?.product  else {return}
                self.productInfo = result
            }
        }
    }
}
