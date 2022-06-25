//
//  HomeViewController.swift
//  e-Buy
//
//  Created by Om Malikah  on 22/11/1443 AH.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var adsCollectionView: UICollectionView!
    @IBOutlet weak var brandsCollectionView: UICollectionView!
    @IBOutlet weak var brandLabel: UILabel!
    
    var homeViewModel: HomeViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        
        homeViewModel = HomeViewModel(serviece: ApiService())
        homeViewModel?.bindingResult = { [weak self] in
            DispatchQueue.main.async {
                self?.brandsCollectionView.reloadData()
            }
        }
        homeViewModel?.getData()
        setupNavigationItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerAdsCell()
        registerBrandsCell()
        adsCollectionView.delegate = self
        adsCollectionView.dataSource = self
        brandsCollectionView.delegate = self
        brandsCollectionView.dataSource = self
        
        adsCollectionView.layer.borderWidth = 2.0
        adsCollectionView.layer.cornerRadius = 20.0
        adsCollectionView.layer.borderColor = UIColor.purple.cgColor
        brandsCollectionView.layer.borderWidth = 2.0
        brandsCollectionView.layer.cornerRadius = 20.0
        brandsCollectionView.layer.borderColor = UIColor.purple.cgColor
        brandLabel.textColor = UIColor.purple
        
        title = "Home"
    }
    
    func registerAdsCell(){
        let adsCell = UINib(nibName: "AdsCollectionViewCell", bundle: nil)
        self.adsCollectionView.register(adsCell, forCellWithReuseIdentifier: "AdsCollectionViewCell")
        
    }
    
    func registerBrandsCell(){
        
        let brandsCell = UINib(nibName: "BrandsCollectionViewCell", bundle: nil)
        self.brandsCollectionView.register(brandsCell, forCellWithReuseIdentifier: "BrandsCollectionViewCell")
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
        if collectionView == brandsCollectionView {
            return homeViewModel?.brands?.count ?? 0
        }else{
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == adsCollectionView {
            
            guard let adsCell = adsCollectionView.dequeueReusableCell(withReuseIdentifier: "AdsCollectionViewCell", for: indexPath) as? AdsCollectionViewCell else {return UICollectionViewCell() }
            adsCell.adsImageView.image = UIImage(named: "Adidas")
            
            return adsCell
            
        }else{
            
            guard let brandsCell = brandsCollectionView.dequeueReusableCell(withReuseIdentifier: "BrandsCollectionViewCell", for: indexPath) as? BrandsCollectionViewCell else {return UICollectionViewCell() }
            guard let brands =  homeViewModel?.brands else {return
                brandsCell }
            brandsCell.brandImageView.kf.setImage(with: URL(string: brands[indexPath.row].image?.src ?? ""))
            brandsCell.brandNameLabel.text = brands[indexPath.row].title
            return brandsCell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == adsCollectionView {
            
        }else{
            let productVC = ProductsViewController(nibName: "ProductsViewController", bundle: nil)
            productVC.barnd = homeViewModel?.brands?[indexPath.row].title ?? "ADIDAS"
            navigationController?.pushViewController(productVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == adsCollectionView {
            return CGSize(width: adsCollectionView.frame.width/1, height: adsCollectionView.frame.height/1 )
            
        }else{
            return CGSize(width: brandsCollectionView.frame.width/2-20, height: brandsCollectionView.frame.height/2-20 )
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == adsCollectionView {
            return 0
        }else{
            return 20
        }
    }
    
}
