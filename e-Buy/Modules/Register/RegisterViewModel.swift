//
//  RegisterViewModel.swift
//  e-Buy
//
//  Created by salah waleed on 29/06/2022.
//

import Foundation

class RegisterViewModel {
    
    var id: Int?
    var done:Bool?{
        didSet{
            bindingresult()
        }
    }
    var bindingresult:(()->()) = {}
    init(){
     
    }
    
    
    
    func register(FirstName:String,email:String,password:String){
        
        let request = ApiRequest()
        request.url = "https://menofia-2022-q3.myshopify.com/admin/api/2022-04/customers.json"
        request.headers = ["Content-Type":"application/json","X-Shopify-Access-Token":"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"]
        request.paramters = ["customer":[ "first_name": FirstName , "last_name": password, "email": email, "verified_email": true]]
 
        
        ApiService.shared.post(request: request) { (err, response: Register?) in
            if err != nil {
                print(err as Any)
                self.done = false
            }else{
                
                guard let result = response?.customer else {return}
                print(result)
                self.done = true
 
            }
        }
        
    }
    
    
}

 
