//
//  AddressViewModel.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 03/07/2022.
//

import Foundation

class AddressViewModel: NSObject {
    var userId = 0
    let userDefaults = UserDefaults.standard
    let networkShared = ApiService.shared
    
    var cellViewModels:[AddressCellViewModel] = [AddressCellViewModel]()
    
    var numberOfCells:Int {
        return cellViewModels.count
    }
    
    override init() {
        super.init()
        fetchDataFromApi()
    }
    
    func fetchDataFromApi(){
        userId = userDefaults.object(forKey: "userId") as? Int ?? 0
        networkShared.getDataFromApi(urlString: allAddresses(userId: userId), baseModel: AddressesContract.self) { (result) in
            switch result {
            case .success(let data):
                if let allAdds = data.addresses {
                    self.processFetchedAddress(address: allAdds)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath)->AddressCellViewModel{
        
        return cellViewModels[indexPath.row]
    }
    
    func createAddressCellViewModel(address:Addresses)->AddressCellViewModel{
        
        let title = address.address2
        let owner = address.name
        let phone = address.phone
        let cityCountry = "\(address.city!) , \(address.country!)"
        let address = address.address1
        
        return AddressCellViewModel(addressTitle: title!, owner: owner!, phoneNumber: phone!, cityCountry: cityCountry, address: address!, isDefault: "isDefault")
    }
    
    func processFetchedAddress(address:[Addresses]){
        var cellViewModels = [AddressCellViewModel]()
        for address in address {
            cellViewModels.append(createAddressCellViewModel(address: address))
        }
        self.cellViewModels = cellViewModels
    }
}
