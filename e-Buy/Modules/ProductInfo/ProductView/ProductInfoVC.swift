//
//  ProductInfoVC.swift
//  e-Buy
//
//  Created by salah waleed on 03/07/2022.
//
import ProgressHUD
import UIKit
import Kingfisher
import Alamofire
class ProductInfoVC: UIViewController {

    var productInfoViewModel : ProductInfoViewModel?
    
    var shouldAnimate = true
    var currentIndex = 0
    var timer:Timer?
    //MARK: - outlet
    
    @IBOutlet weak var favBtn: UIButton!
    
    @IBOutlet weak var bagBtn: UIButton!
    
    @IBOutlet weak var firstVewCvView: UIView!
    
    @IBOutlet weak var imagesProducttCV: UICollectionView!
    
    @IBOutlet weak var pageControler: UIPageControl!
    
    @IBOutlet weak var secViewInfo: UIView!
    
    @IBOutlet weak var productNameLbl: UILabel!
    
    @IBOutlet weak var productPriceLbl: UILabel!
    
    @IBOutlet weak var sizeProductCollectionView: UICollectionView!
    
    @IBOutlet weak var productInfoTextView: UITextView!
    
    
    @IBOutlet weak var coustmerReviewsTV: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesProducttCV.delegate = self
        imagesProducttCV.dataSource = self
        sizeProductCollectionView.delegate = self
        sizeProductCollectionView.dataSource = self
        coustmerReviewsTV.delegate = self
        coustmerReviewsTV.dataSource = self
        registerCell()
        productInfoViewModel?.bindingResult = { [self] in
            self.imagesProducttCV.reloadData()
            self.sizeProductCollectionView.reloadData()
            self.productNameLbl.text = self.productInfoViewModel?.productInfo?.title
            self.productPriceLbl.text = self.productInfoViewModel?.productInfo?.variants?[0].price
            self.productInfoTextView.text = self.productInfoViewModel?.productInfo?.bodyHTML
            self.startTimer()
            setupNavigationItems()
        }
    }
    func registerCell(){
        
        let imageCell = UINib(nibName: "imageCvCell", bundle: nil)
        self.imagesProducttCV.register(imageCell, forCellWithReuseIdentifier: "imageCvCell")
        let sizeCell = UINib(nibName: "SizeCVCell", bundle: nil)
        self.sizeProductCollectionView.register(sizeCell, forCellWithReuseIdentifier: "SizeCVCell")
        coustmerReviewsTV.register(UINib(nibName: "RateTVCell", bundle: nil), forCellReuseIdentifier: "RateTVCell")
    }

    func startTimer(){
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.timeAction), userInfo: nil, repeats: true)
    }
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    @objc func timeAction(){
        if shouldAnimate {
            if currentIndex <  (productInfoViewModel?.productInfo?.images?.count ?? 4) - 1 {
                currentIndex += 1
                pageControler.currentPage = currentIndex
            }else{
                currentIndex = 0
                pageControler.currentPage = currentIndex
            }
            imagesProducttCV.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    func setupNavigationItems() {
 
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
        navigationController?.navigationBar.tintColor = .purple
        
 
        
    }
    @IBAction func saveToFavBtn(_ sender: UIButton) {
        if productInfoViewModel?.ISLogin() == false {
            ProgressHUD.showError("must be login")
        }else{
            
        }
    }
    
    @IBAction func addToBagBtn(_ sender: UIButton) {
        if productInfoViewModel?.ISLogin() == false {
            ProgressHUD.showError("must be login")
        }else{
            
        }
    }
    
    @IBAction func goToReview(_ sender: UIButton) {
        let rev = ReviewVc()
        self.navigationController?.pushViewController(rev, animated: true)
    }
    
}

extension ProductInfoVC:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == imagesProducttCV {
        return   productInfoViewModel?.productInfo?.images?.count ?? 0
        }else{
            return productInfoViewModel?.productInfo?.variants?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == imagesProducttCV {
            guard let ImageProductCell = imagesProducttCV.dequeueReusableCell(withReuseIdentifier: "imageCvCell", for: indexPath) as? imageCvCell else {return UICollectionViewCell() }
 
            ImageProductCell.prodctimgVew.kf.setImage(with: URL(string: productInfoViewModel?.productInfo?.images?[indexPath.row].src ?? ""))
            
            return ImageProductCell
        }else{
            guard let sizeCell = sizeProductCollectionView.dequeueReusableCell(withReuseIdentifier: "SizeCVCell", for: indexPath) as? SizeCVCell else {return UICollectionViewCell() }
            sizeCell.sizeLbl.text = productInfoViewModel?.productInfo?.variants?[indexPath.row].option1
            return sizeCell
        }
    }
    
    
    
}

extension ProductInfoVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == imagesProducttCV {
              return CGSize(width: imagesProducttCV.frame.width, height: imagesProducttCV.frame.height)
        }else{
            return CGSize(width: sizeProductCollectionView.frame.width / 4, height: sizeProductCollectionView.frame.height * 0.85)
        }
    }
}


extension ProductInfoVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RateTVCell", for: indexPath) as? RateTVCell else {return UITableViewCell()}
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return coustmerReviewsTV.frame.height / 1.5
    }
    
}
