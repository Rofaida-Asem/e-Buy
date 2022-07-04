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
    
    func getDataFromApi<T:Codable>(urlString: String,baseModel: T.Type ,completion: @escaping (Result<T,ErrorMessages>)->Void ){
        guard let url = URL(string: urlString) else{
            completion(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(.failure(.noInternet))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                //                print("response \(response)")
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                let resultData = try decoder.decode(T.self, from: data)
                completion(.success(resultData))
                //                print(resultData)
                
            }catch{
                print(error.localizedDescription)
                completion(.failure(.invalidDataAfterDecoding))
                
            }
        }
        task.resume()
        
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
    
    func postDataToApi<T:Codable>(urlString: String,httpMethod:httpMethod,body:[String: Any],baseModel: T.Type ,completion: @escaping (Result<T,ErrorMessages>)->Void ){
        guard let url = URL(string: urlString) else{
            completion(.failure(.invalidUrl))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration .default)
        
        urlRequest.httpMethod = httpMethod.rawValue
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        urlRequest.httpShouldHandleCookies = false
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        urlRequest.httpBody = jsonData
        
//        print(url)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let _ = error {
                completion(.failure(.noInternet))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                //                print("response \(response)")
                return
            }
//            print(response)
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            print(data )
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                let resultData = try decoder.decode(T.self, from: data)
                completion(.success(resultData))
                //                print(resultData)
                
            }catch{
                print(error.localizedDescription)
                completion(.failure(.invalidDataAfterDecoding))
            }
        }
        task.resume()
    }


func addAddress(id: Int, address: Addresses, completion: @escaping(Data?, URLResponse?, Error?)->()){
    let id = id
    let customer = CustomerAddress(addresses: [address])
    let putObject = PutAddress(customer: customer)
    guard let url = URL(string: customerById(userId: id)) else {return}
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    let session = URLSession.shared
    request.httpShouldHandleCookies = false
    
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: putObject.asDictionary(), options: .prettyPrinted)
    } catch let error {
        print(error.localizedDescription)
    }
    //HTTP Headers
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    session.dataTask(with: request) { (data, response, error) in
        completion(data, response, error)
    }.resume()
}

func deleteAddress(userId: Int, addressId: Int,completion: @escaping(Data?, URLResponse?, Error?)->()){
   
    guard let url = URL(string: addressById(userId: userId, addressId: addressId)) else {return}
    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"
    let session = URLSession.shared
    request.httpShouldHandleCookies = false
    
    //HTTP Headers
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    session.dataTask(with: request) { (data, response, error) in
        completion(data, response, error)
    }.resume()
}



enum httpMethod: String {
    case post = "POST"
    case get  = "GET"
}
    
}
