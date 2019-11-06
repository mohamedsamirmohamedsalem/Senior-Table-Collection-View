//
//  MainTableViewCell.swift
//  Senior-Table-Collection-View
//
//  Created by Mohamed samir on 6/2/19.
//  Copyright © 2019 Mohamed samir . All rights reserved.
//

import UIKit


class MainTableViewCell : BaseTableViewCell{
    
    
    @IBOutlet weak var MainCollectionViewCell: UICollectionView!
    var infinteSlider: [UIImage] = images
    
    //MARK:- -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        //MainCollectionViewCell.register(UINib(nibName: "SingleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SingleCollectionViewCell")
        
        MainCollectionViewCell.RegisterNib(Cell: SingleCollectionViewCell.self)
    }
    
    override func reloadData() {
        MainCollectionViewCell.reloadData()
    }

}

extension MainTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infinteSlider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleCollectionViewCell", for: indexPath) as! SingleCollectionViewCell
        
        let cell = collectionView.dequeue(IndexPath: indexPath ) as SingleCollectionViewCell
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.Img.image = images[indexPath.row]
        
        
        return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = SCREEN_WIDTH / 2
        let height: CGFloat = width * 9 / 16
        return CGSize(width: width, height: height)
    }
    
    
}
