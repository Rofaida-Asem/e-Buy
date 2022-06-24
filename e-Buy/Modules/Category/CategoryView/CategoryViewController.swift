//
//  CategoryViewController.swift
//  e-Buy
//
//  Created by Om Malikah  on 22/11/1443 AH.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categoryViewModel: CategoryViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        
        registerCell()
        categoryViewModel = CategoryViewModel(serviece: ApiService())
        categoryViewModel?.bindingResult = { [weak self] in
            DispatchQueue.main.async {
                self?.categoryCollectionView.reloadData()
            }
        }
        categoryViewModel?.getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    func registerCell(){
        let categoryCell = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        self.categoryCollectionView.register(categoryCell, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryViewModel?.product?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let categoryCell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell() }
        guard let products =  categoryViewModel?.product else {return
            categoryCell }
        categoryCell.categoryImageView.kf.setImage(with: URL(string: products[indexPath.row].image?.src ?? ""))
      //  categoryCell.priceLabel.text = products[indexPath.row].variants
        
        
        return categoryCell
        
    }
    
    
}
