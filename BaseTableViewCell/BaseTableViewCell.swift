//
//  BaseTableViewCell.swift
//  Senior-Table-Collection-View
//
//  Created by Mohamed samir on 6/2/19.
//  Copyright © 2019 Mohamed samir. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    //@IBOutlet weak var containerView: UIView!
    var containerVC : UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func reloadData(){}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
