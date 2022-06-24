//
//  ProductsViewController.swift
//  e-Buy
//
//  Created by Om Malikah  on 25/11/1443 AH.
//

import UIKit

class ProductsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    var productsViewModel: ProductsViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        
        registerCell()
        productsViewModel = ProductsViewModel(serviece: ApiService())
        productsViewModel?.bindingResult = { [weak self] in
            DispatchQueue.main.async {
                self?.productsCollectionView.reloadData()
            }
        }
        productsViewModel?.getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
    }
    
    func registerCell(){
        let categoryCell = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        self.productsCollectionView.register(categoryCell, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }

    @IBAction func favoriteButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func cartButton(_ sender: UIBarButtonItem) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productsViewModel?.product?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let categoryCell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell() }
        guard let products =  productsViewModel?.product else {return
            categoryCell }
        categoryCell.categoryImageView.kf.setImage(with: URL(string: products[indexPath.row].image?.src ?? ""))
      //  categoryCell.priceLabel.text = products[indexPath.row].variants
        
        
        return categoryCell
    }
   

}

