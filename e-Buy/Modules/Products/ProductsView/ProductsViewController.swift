//
//  ProductsViewController.swift
//  e-Buy
//
//  Created by Om Malikah  on 25/11/1443 AH.
//

import UIKit

class ProductsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var productsViewModel: ProductsViewModel?
    var barnd: String!
    
    override func viewWillAppear(_ animated: Bool) {
        
        registerCell()
        activityIndicatorView.startAnimating()
        productsViewModel = ProductsViewModel(serviece: ApiService())
        productsViewModel?.bindingResult = { [weak self] in
            DispatchQueue.main.async {
                self?.productsCollectionView.reloadData()
                self?.activityIndicatorView.isHidden = true
            }
        }
        productsViewModel?.getData(forBrand: barnd)
        setupNavigationItems()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        title = barnd
        
    }
    
    func registerCell(){
        let categoryCell = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        self.productsCollectionView.register(categoryCell, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    
    func setupNavigationItems() {
        
        let favButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(favoTapped))
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(cartTapped))
        favButton.tintColor = .purple
        cartButton.tintColor = .purple
        
        navigationItem.setRightBarButtonItems([favButton,cartButton], animated: false)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
        navigationController?.navigationBar.tintColor = .purple
    }
    
    @objc
    private func favoTapped() {
        print("like tapped!!")
    }
    
    @objc
    private func cartTapped() {
        print("cart tapped!!")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productsViewModel?.products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let categoryCell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell() }
        guard let products =  productsViewModel?.products else {return
            categoryCell }
        categoryCell.categoryImageView.kf.setImage(with: URL(string: products[indexPath.row].image?.src ?? ""))
        categoryCell.priceLabel.text = products[indexPath.row].variants?.first?.price
        
        return categoryCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height/3)
    }
}

