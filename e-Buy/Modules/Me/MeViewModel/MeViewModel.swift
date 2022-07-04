//
//  MeViewModel.swift
//  e-Buy
//
//  Created by salah waleed on 02/07/2022.
//

import Foundation

class MeViewModel {
    
    var name:String?
    var id:Int?
    let defaults = UserDefaults.standard
    
    
    
    func ISLogin() ->Bool {
        
    return defaults.bool(forKey: "userID")
        
        
    }
    
    func getUserDefault()->String{
    
        return defaults.string(forKey: "userName") ?? ""
    }
    
    
    
    
}
