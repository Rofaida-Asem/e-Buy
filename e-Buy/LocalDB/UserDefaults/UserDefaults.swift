//
//  UserDefaults.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 03/07/2022.
//

import Foundation

class UserDefaultsClass{
    
    static let shared = UserDefaultsClass()
    
    
    func saveValue<V>(value:V,key: String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    
    func getValue<V>(key:String)->V{
        let userDefaults = UserDefaults.standard
        let value = userDefaults.object(forKey: key) as! V
        return value
        
    }
}
