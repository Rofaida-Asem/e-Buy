//
//  ProductsViewController.swift
//  e-Buy
//
//  Created by
//

import UIKit

class ProductsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
  
    @IBOutlet weak var firstVew: UIView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var productsViewModel: ProductsViewModel?
    var barnd: String!
    var isOpen:Bool? = false
    override func viewWillAppear(_ animated: Bool) {
        firstVew.isHidden = true
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
        searchBar.delegate = self
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        title = barnd
     
    }
    @IBAction func sliderFilter(_ sender: UISlider) {
        priceLbl.text = String(Int(sender.value))
        productsViewModel?.filterBYPrice(numb: sender.value)
        productsCollectionView.reloadData()
    }
    
    
    func registerCell(){
        let categoryCell = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        self.productsCollectionView.register(categoryCell, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }

    
    func setupNavigationItems() {
        
        let filButtn = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(filterTapped))
 
        filButtn.tintColor = .purple
      
        
        navigationItem.setRightBarButtonItems([filButtn], animated: false)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
        navigationController?.navigationBar.tintColor = .purple
    }
    
    @objc
    private func filterTapped() {
        if isOpen == false {
        firstVew.isHidden = false
            isOpen = true
        }else{
            firstVew.isHidden = true
            isOpen = false
        }
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productsViewModel?.filterData?.count ?? 0
         
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let categoryCell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell() }
        guard let products =  productsViewModel?.filterData else {return
            categoryCell }
        categoryCell.categoryImageView.kf.setImage(with: URL(string: products[indexPath.row].image?.src ?? ""))
        categoryCell.priceLabel.text = products[indexPath.row].variants?.first?.price
        
        return categoryCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let producinfo = ProductInfoVC()
        producinfo.productInfoViewModel = ProductInfoViewModel(id: productsViewModel?.products?[indexPath.row].variants?[0].product_id ?? 0)
        self.navigationController?.pushViewController(producinfo, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height/3.1)
    }
    
    
}

extension ProductsViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
 
        productsViewModel?.filter(searchText: searchText)
   
        productsViewModel?.bindingFilterResult = {
            self.productsCollectionView.reloadData()
        }
        }
   
    }

