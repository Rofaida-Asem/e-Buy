//
//  ShoppingCartViewModel.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 29/06/2022.
//

import Foundation
class CartViewModel: NSObject {
    
    let networkShared  = ApiService.shared
    let coreDataShared = CoreDataManager.shared
    private var cartItems: [CartItem] = [CartItem]()
    private var cellViewModels:[CartItemNetworkModel] = [CartItemNetworkModel]() {
       didSet{
           self.reloadTableViewClosure()
       }
   }
    
    func getCellViewModelArr() -> [CartItemNetworkModel]{
        return self.cellViewModels
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    var totalPrice: Int = 0 {
        didSet{
            self.updateCashPriceLabel()
        }
    }
    
    var updateCashPriceLabel: (()->())  = {}
    var reloadTableViewClosure: (()->()) = {}
    
    override init() {
        super.init()
        fetchCartItems()
    }
    
    
    func fetchCartItems(){
       print("fetchCartItems function ViewModel \n")
        CoreDataManager.shared.updateOrderArr()
       
       coreDataShared.getAllWithArray { [weak self] result in
           guard let self = self else { return }
           switch result{
           case .success(let cartItems):
               self.processFetchedCartItems(cartItems: cartItems)
               CoreDataManager.shared.order = cartItems
           case .failure(let error):
               print(error)
           }
       }
   }
    
    func getCellViewModel(at indexPath: IndexPath) -> CartItemNetworkModel{
        
        //here i can get any cell by its index
        
        return cellViewModels[indexPath.row]
    }
    
    func createCartItemCellViewModel(cartItem:CartItem) -> CartItemNetworkModel{
        
        //here i can manipulte cartItem like making calculations and so on
        let cartItem = CartItemNetworkModel(name: cartItem.name, price: cartItem.price, imgUrl: cartItem.imgUrl,id: cartItem.id,qty: cartItem.qty,variant_id:cartItem.variant_id)
        return cartItem
    }
    
    private func processFetchedCartItems(cartItems: [CartItem]){
        if cartItems.count == 0{
           print("")
        }
        self.cartItems     = cartItems
        var viewModelCells = [CartItemNetworkModel]()
        for cartItem in cartItems {
            viewModelCells.append(createCartItemCellViewModel(cartItem: cartItem))
        }
        self.cellViewModels = viewModelCells
        calculateTotalPrice()
    }
    
    
    func calculateTotalPrice(){
        var cartItemPrice = 0
        for item in cellViewModels{
            guard let price = Int(item.price) else {return}
            guard let qty   = Int(item.qty) else {return}
            cartItemPrice += (price * qty)
        }
        self.totalPrice = cartItemPrice
    }
    
    func deleteItem(at indexPath:IndexPath){
        CoreDataManager.shared.deleteCartItem(cartItem: cartItems[indexPath.row])
        self.fetchCartItems()
    }
}
