//
//  LoginVm.swift
//  e-Buy
//
//  Created by salah waleed on 29/06/2022.
//

import Foundation
class LoginViewModel{
    
    var sucess:Bool?{
        didSet{
            bindingResult()
        }
    }
    
    
    var bindingResult:(()->()) = {}
  
    func login(email:String,password:String){
        
        let request = ApiRequest()
        request.url = Constants.getLogin_URL() + "email:\(email)+last_name:\(password)"
        print(request.url ?? "")
        request.headers = Constants.headers
        print(request.headers ?? "")
        request.paramters = nil
        ApiService.shared.getApi(request: request) { (err, response: Login?) in
         
            if err != nil {
                print(err as Any)
                self.sucess = false
            }else{
                
                guard let result = response  else {return}
            
                guard let id = result.customers?[0].id else {return}
                guard let name = result.customers?[0].firstName else {return}
              
                let defaults = UserDefaults.standard
                    defaults.set(id, forKey: "userID")
                defaults.set(name, forKey: "userName")
     
                self.sucess = true
            
        }
    }
}
}
