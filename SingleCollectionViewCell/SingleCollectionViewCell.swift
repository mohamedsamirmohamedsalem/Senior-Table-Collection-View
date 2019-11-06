//
//  SingleCollectionViewCell.swift
//  Senior-Table-Collection-View
//
//  Created by Mohamed samir on 6/2/19.
//  Copyright © 2019 Mohamed samir. All rights reserved.
//

import UIKit

class SingleCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet weak var Img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        self.backgroundView = UIView()
        self.contentView.backgroundColor = UIColor.clear
    }
    
    
}
