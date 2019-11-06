//
//  Generic+Extention.swift
//  Senior-Table-Collection-View
//
//  Created by Mohamed samir on 6/4/19.
//  Copyright © 2019 Mohamed samir. All rights reserved.
//

import Foundation
import UIKit


extension UITableView{
    
    func RegisterNib<Cell : UITableViewCell>(Cell : Cell.Type){
        
        let nibName = String(describing: Cell.self)
        
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeue<Cell : UITableViewCell>(IndexPath : IndexPath) -> Cell{
        
        let identifier = String(describing: Cell.self)
        
        //let CellForIndex = Cell as UITableViewCell
        
        guard let Cell = self.dequeueReusableCell(withIdentifier: identifier, for: IndexPath ) as? Cell  else {
            fatalError("there is no Cell")
        }
        
        return Cell
    }
    
}



extension UICollectionView{
    
    func RegisterNib<Cell : UICollectionViewCell>(Cell : Cell.Type){
        
        let nibName = String(describing: Cell.self)
        
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
        
    }
    
    func dequeue<Cell : UICollectionViewCell>(IndexPath : IndexPath) -> Cell{
        
        let identifier = String(describing: Cell.self)
        
        //let CellForIndex = Cell as UITableViewCell
        
        guard let Cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: IndexPath ) as? Cell  else {
            fatalError("there is no Cell")
        }
        
        return Cell
    }
    
}
