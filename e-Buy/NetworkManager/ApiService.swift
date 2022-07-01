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
    
    func getApi<T:Codable>(request:ApiRequest, completion: @escaping (String?, _ response:T?) -> ()){
        guard let url = URL(string: request.url ?? "") else {return}
        var AlamoHeaders: HTTPHeaders? = nil
        if request.headers != nil{
            AlamoHeaders = HTTPHeaders(request.headers!)
        }
        
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: AlamoHeaders).response { (response) in
            guard let data = response.data else {return}
            switch response.result {
                
            case .success(_):
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(nil, result)
                }catch{
                    
                    print(error.localizedDescription)
                    completion(response.error?.localizedDescription ?? "",nil)
                    
                }
             
            case .failure(_):
                print(response.error?.localizedDescription ?? "")
                completion(response.error?.localizedDescription ?? "",nil)
            }
        }
    }

    func post<T:Codable>( request:ApiRequest, completion: @escaping (String?, _ response: T?) -> ()){
        
        guard let url = URL(string: request.url ?? "") else {return}
        
        var AlamoHeaders: HTTPHeaders? = nil
        if request.headers != nil{
            AlamoHeaders = HTTPHeaders(request.headers!)
        }
        
        AF.request(url, method: .post, parameters: request.paramters, encoding: JSONEncoding.default, headers: AlamoHeaders).response { (response) in
            guard let data = response.data else {return}
            switch response.result{
                
            case .success(_):
                do{
 
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(nil,result)
                    
                }catch{
                    print(error.localizedDescription)
                    completion(response.error?.localizedDescription ?? "",nil)
                }
            case .failure(_):
                //parse json
                //get error message
               
                var message: String?
                let json = ["errors": ["email": ["email not vaild"]]]
                if let err = json["errors"] as? [String : Any] {
                   
                    for (_ ,value) in err {
                                            if let errArr = value as? [String] {
                                    message = (message ?? "") + errArr.joined(separator: "\n")
                                  }
                                        }
                }else if let err = json["message"] as? String {
                    message = err
                }
                
                print(response.error?.localizedDescription ?? "")
                completion(message ?? (response.error?.localizedDescription ?? "something goes wrong"),nil)
            }
          
        }
        
    }
}



 
