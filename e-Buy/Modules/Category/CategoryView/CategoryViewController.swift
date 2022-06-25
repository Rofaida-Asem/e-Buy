//
//  CategoryViewController.swift
//  e-Buy
//
//  Created by Om Malikah  on 22/11/1443 AH.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var mainCategoryCollectionView: UICollectionView!
    
    var categoryViewModel: CategoryViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        
        registerCell()
        categoryViewModel = CategoryViewModel(serviece: ApiService())
        categoryViewModel?.bindingResultProducts = { [weak self] in
            DispatchQueue.main.async {
                self?.categoryCollectionView.reloadData()
            }
        }
        
        //   categoryViewModel = CategoryViewModel(serviece: ApiService())
        categoryViewModel?.bindingCustomCollection = { [weak self] in
            DispatchQueue.main.async {
                self?.mainCategoryCollectionView.reloadData()
            }
        }
        
        categoryViewModel?.getData()
        categoryViewModel?.getMainCategory()
        setupNavigationItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        registerMainCategoryCell()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        mainCategoryCollectionView.delegate = self
        mainCategoryCollectionView.dataSource = self
        title = "Category"
        
    }
    
    func registerCell(){
        let categoryCell = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        self.categoryCollectionView.register(categoryCell, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    func registerMainCategoryCell(){
        
        let mainCategoryCell = UINib(nibName: "MainCategoryCollectionViewCell", bundle: nil)
        self.mainCategoryCollectionView.register(mainCategoryCell, forCellWithReuseIdentifier: "MainCategoryCollectionViewCell")
    }
    
    func setupNavigationItems() {
        let favButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(favoTapped))
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(cartTapped))
        favButton.tintColor = .purple
        cartButton.tintColor = .purple
        
        navigationItem.setRightBarButtonItems([favButton], animated: false)
        navigationItem.setLeftBarButtonItems([cartButton], animated: false)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
        
    }
    
    @objc
    private func favoTapped() {
        print("fav tapped!!")
    }
    @objc
    private func cartTapped() {
        print("cart tapped!!")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return categoryViewModel?.product?.count ?? 0
        }else{
            return (categoryViewModel?.custemCollection?.count ?? 3 ) - 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollectionView {
            guard let categoryCell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell() }
            guard let products =  categoryViewModel?.product else {return
                categoryCell }
            categoryCell.categoryImageView.kf.setImage(with: URL(string: products[indexPath.row].image?.src ?? ""))
            //  categoryCell.priceLabel.text = products[indexPath.row].variants
            
            
            return categoryCell
        }else{
            guard let mainCategoryCell = mainCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "MainCategoryCollectionViewCell", for: indexPath) as? MainCategoryCollectionViewCell else {return UICollectionViewCell() }
            mainCategoryCell.mainCategoryLabel.text = categoryViewModel?.custemCollection?.first?.title
            return mainCategoryCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height/3)
        }else{
            return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.height/1)
        }
    }
    
}
