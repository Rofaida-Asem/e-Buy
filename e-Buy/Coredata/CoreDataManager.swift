//
//  CoreDataManager.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 23/06/2022.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    var order = [CartItem]()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ShoppingCartModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func insertCartItem(cartItem: CartItem, qtyTypeProcess: qtyTypeProcess) {
        
        if checkCartItemBeforeInsert(cartItem: cartItem, qtyTypeProcess: qtyTypeProcess) {
            print("object already saved")
        }else{
            let managedObjectContext = persistentContainer.viewContext
            let entity           = NSEntityDescription.entity(forEntityName: "Cart", in: managedObjectContext)!
            let cartItemCoreData = NSManagedObject(entity: entity, insertInto: managedObjectContext)
            
            cartItemCoreData.setValue(cartItem.name, forKey: "name")
            cartItemCoreData.setValue(cartItem.imgUrl, forKey: "imageUrl")
            cartItemCoreData.setValue(cartItem.price, forKey: "price")
            cartItemCoreData.setValue(cartItem.id, forKey: "id")
            cartItemCoreData.setValue(cartItem.qty, forKey: "quantity")
            cartItemCoreData.setValue(cartItem.variant_id, forKey: "variant_id")

            
            
            do{
                try managedObjectContext.save()
                print("new product saved")
                updateOrderArr()
                
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    func checkCartItemBeforeInsert(cartItem: CartItem, qtyTypeProcess: qtyTypeProcess) -> Bool {
        var success = false
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Cart")
        fetchRequest.predicate = NSPredicate(format: "id == %@", cartItem.id)
        do{
           let objects = try managedObjectContext.fetch(fetchRequest)
            if objects.count == 1 {
                let cartItemUpdate = objects[0]
                let oldQytStr = cartItemUpdate.value(forKey: "quantity") as! String
                let oldQytInt = Int(oldQytStr)!
                let qty       = 1
                switch qtyTypeProcess {
                case .addition:
                    cartItemUpdate.setValue("\(oldQytInt + qty)", forKey: "quantity")
                case .subtraction:
                    cartItemUpdate.setValue("\(oldQytInt - qty)", forKey: "quantity")
                }
                
                
                self.saveContext()
                success = true
            }

        }catch let error as NSError {
            print("Could not retrive data . \(error), \(error.userInfo)")
            success = false
        }
        return success
    }
    
    func saveOrderArrToCoreData(cartItemArr: [CartItem]){
        for cartItem in cartItemArr{
            insertCartItem(cartItem: cartItem, qtyTypeProcess: .addition )
        }
        
    }
        
        func updateOrderArr(){
            self.order = [CartItem]()
            getAllWithArray { result in
                switch result{
                case .success(let cartItem):
                    CoreDataManager.shared.order = cartItem
                case .failure(let error):
                    print(error)
                }
            }
        }

    private func getAllOfNSManageObjectArr(completion:@escaping((Result<[NSManagedObject], ErrorMessages>) -> Void)) {
        var objects = [NSManagedObject]()
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Cart")
        do{
            objects = try managedObjectContext.fetch(fetchRequest)
            completion(.success(objects))
        }catch let error as NSError {
            print("Could not retrive data . \(error), \(error.userInfo)")
            completion(.failure(.errorRetivingFromCoreData))
        }
    }
    
    func getAllWithArray( completion: @escaping ((Result<[CartItem], ErrorMessages>) -> Void)) {
        var arrOfCartItem = [CartItem]()
        
        getAllOfNSManageObjectArr { result in
            switch result{
            case .success(let arr):
                for item in arr{
                    let cartItem = CartItem(name: item.value(forKey: "name") as! String, price: item.value(forKey: "price") as! String, imgUrl: item.value(forKey: "imageUrl") as! String,id: item.value(forKey: "id") as! String,qty: item.value(forKey: "quantity") as! String,variant_id: item.value(forKey: "variant_id") as! String )
                    arrOfCartItem.append(cartItem)
                }
                completion(.success(arrOfCartItem))
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
    
    func deleteCartItem(cartItem: CartItem){
       
            do {
                let context = self.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
                
                fetchRequest.predicate = NSPredicate(format: "id == %@", cartItem.id  )
                let result = try context.fetch(fetchRequest)
                context.delete((result as! [NSManagedObject]).first!)
                try context.save()
                print("product deleted successfully")
            } catch let error {
                print("error while deleting product :", error)
            }
        
    }
   
    
    
    enum qtyTypeProcess {
        case addition
        case subtraction
    }
    
    
}
