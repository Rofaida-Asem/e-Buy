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
    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    
    var categoryViewModel: CategoryViewModel?
    var id : Int = 286861459627
    var mainCategoryArray = ["Kids","Men","Sale","Women"]
    var subCategoryArray = ["SHOES","T-SHIRTS","ACCESSORIES"]
    var currentType : String = "SHOES"
    
    override func viewWillAppear(_ animated: Bool) {
        
        registerCell()
        activityIndicatorView.startAnimating()
        categoryViewModel = CategoryViewModel(serviece: ApiService())
        categoryViewModel?.bindingResultProducts = { [weak self] in
            DispatchQueue.main.async {
                self?.categoryCollectionView.reloadData()
                self?.activityIndicatorView.isHidden = true
            }
        }
        
        categoryViewModel?.bindingCustomCollection = { [weak self] in
            DispatchQueue.main.async {
                self?.mainCategoryCollectionView.reloadData()
            }
        }
        
        categoryViewModel?.bindingSubCategories = { [weak self] in
                DispatchQueue.main.async {
                    self?.subCategoryCollectionView.reloadData()
                }
        }
        
        categoryViewModel?.getMainCategory()
        categoryViewModel?.getData(byCollectionId: id)
        setupNavigationItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        mainCategoryCollectionView.delegate = self
        mainCategoryCollectionView.dataSource = self
        subCategoryCollectionView.delegate = self
        subCategoryCollectionView.dataSource = self
        title = "Category"
        
    }
    
    func registerCell(){
        let categoryCell = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        self.categoryCollectionView.register(categoryCell, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        let mainCategoryCell = UINib(nibName: "MainCategoryCollectionViewCell", bundle: nil)
        self.mainCategoryCollectionView.register(mainCategoryCell, forCellWithReuseIdentifier: "MainCategoryCollectionViewCell")
        let subCategoryCell = UINib(nibName: "SubCategoryCollectionViewCell", bundle: nil)
        self.subCategoryCollectionView.register(subCategoryCell, forCellWithReuseIdentifier: "SubCategoryCollectionViewCell")
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
        }else if collectionView == mainCategoryCollectionView {
            return mainCategoryArray.count
        }else{
            return subCategoryArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollectionView {
            guard let categoryCell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell() }
            guard let products =  categoryViewModel?.product else {return
                categoryCell }
            categoryCell.categoryImageView.kf.setImage(with: URL(string: products[indexPath.row].image?.src ?? ""))
            categoryCell.priceLabel.text = products[indexPath.row].variants?.first?.price 
            
            return categoryCell
        }else if collectionView == mainCategoryCollectionView {
            guard let mainCategoryCell = mainCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "MainCategoryCollectionViewCell", for: indexPath) as? MainCategoryCollectionViewCell else {return UICollectionViewCell() }
            mainCategoryCell.mainCategoryLabel.text = mainCategoryArray[indexPath.row]
            return mainCategoryCell
        }else{
            guard let subCategoryCell = subCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCollectionViewCell", for: indexPath) as? SubCategoryCollectionViewCell else {return UICollectionViewCell() }
            
            subCategoryCell.subCategoryLabel.text = subCategoryArray[indexPath.row]
            return subCategoryCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            
        }else if collectionView == mainCategoryCollectionView {
            id = categoryViewModel?.custemCollection?[indexPath.row+1].id ?? 0
            categoryViewModel?.getData(byCollectionId: id)
          
            guard let label = (mainCategoryCollectionView.cellForItem(at: indexPath) as! MainCategoryCollectionViewCell).mainCategoryLabel else {return}
            label.textColor = .white
            
        }else if collectionView == subCategoryCollectionView {
            currentType = subCategoryArray[indexPath.row]
            categoryViewModel?.getSubCategory(byProductType: currentType)
            
            guard let label = (subCategoryCollectionView.cellForItem(at: indexPath) as! SubCategoryCollectionViewCell).subCategoryLabel else {return}
            label.textColor = .purple
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            
        }else if collectionView == mainCategoryCollectionView {
    
            
            guard let label = (mainCategoryCollectionView.cellForItem(at: indexPath) as! MainCategoryCollectionViewCell).mainCategoryLabel else {return}
            label.textColor = .purple
            
        }else if collectionView == subCategoryCollectionView {
            
            guard let label = (subCategoryCollectionView.cellForItem(at: indexPath) as! SubCategoryCollectionViewCell).subCategoryLabel else {return}
            label.textColor = .black
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            return CGSize(width: categoryCollectionView.frame.width/3, height: categoryCollectionView.frame.height/3)
        }else{
            return CGSize(width: mainCategoryCollectionView.frame.width/4, height: mainCategoryCollectionView.frame.height/1)
        }
    }
    
}
