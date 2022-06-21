//
//  ApiService.swift
//  e-Buy
//
//  Created by Om Malikah  on 21/11/1443 AH.
//

import Foundation
import Alamofire

class ApiService {
    
    static let shared = ApiService()
    
    private init() {
        
    }
    
    func getData<T: Decodable>(url: String, completion: @escaping (T?,Error?)-> Void){
        AF.request(url).response { (response) in
            guard let data = response.data else { return }
            switch response.result {
            case .success(_):
                do{
                    let posts = try JSONDecoder().decode(T.self, from: data)
                    completion(posts, nil)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
