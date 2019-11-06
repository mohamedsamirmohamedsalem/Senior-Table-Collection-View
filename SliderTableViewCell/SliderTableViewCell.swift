//
//  SliderCollectionViewCell.swift
//  Senior-Table-Collection-View
//
//  Created by Mohamed samir on 6/2/19.
//  Copyright © 2019 Mohamed samir. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialPageControl

class SliderTableViewCell : BaseTableViewCell{
    
    let pageControl = MDCPageControl()
    
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var hightConst: NSLayoutConstraint!
    @IBOutlet weak var widthConst: NSLayoutConstraint!
    
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    var currentPage = 0
    var contentOffset : CGPoint!
    var infinteSlider: [UIImage] = images
    var timer: Timer?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        width = SCREEN_WIDTH // - 32.0
        height = width * 9.0 / 16.0
        
        let pageControlSize = pageControl.sizeThatFits(self.bounds.size)
        pageControl.frame = CGRect(x: 0, y: self.bounds.height - pageControlSize.height, width: self.bounds.width, height: pageControlSize.height)
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .gray
        
        pageControl.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
        pageControl.clipsToBounds = false
        pageControl.defersCurrentPageDisplay = false
        self.addSubview(pageControl)
        
        //CollectionView.register(UINib(nibName: "SingleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SingleCollectionViewCell")
        
        CollectionView.RegisterNib(Cell: SingleCollectionViewCell.self)
        
        hightConst.constant = height
        widthConst.constant = width
        
        infinteSlider = images
    }
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
        }
    }
    
    @objc func scrollAutomatically(_ timer1: Timer) {
        
        if let coll  = CollectionView {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.item)!  < infinteSlider.count - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.item)! + 1, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
                
            }
        }
    }
    
    override func reloadData()
    {

        
        if infinteSlider.count > 1
        {
            startTimer()
        }
        
        CollectionView.reloadData()
        
    }
    
}

extension SliderTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource{
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infinteSlider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleCollectionViewCell", for: indexPath) as! SingleCollectionViewCell
        
        let cell = collectionView.dequeue(IndexPath: indexPath ) as SingleCollectionViewCell
        
        pageControl.numberOfPages = images.count
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.Img.image = infinteSlider[indexPath.row]
        
        return cell
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        pageControl.scrollViewDidScroll(scrollView)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        pageControl.scrollViewDidEndDecelerating(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    
    /*
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
     //        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "opens_at"), object: self, userInfo: ["type" : silder.sliderOpensText ?? "","currentView" : containerVc!])
     let silder = infinteSlider[indexPath.item]
     
     OpenViewsHandler.viewsToNavigate(opensType:silder.sliderOpensText ?? "", currentView: containerVc!, url: silder.slider_URL , currentTab: containerVc?.tabBarController?.selectedIndex)
     
     }
     
     */
    
}

extension SliderTableViewCell : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
