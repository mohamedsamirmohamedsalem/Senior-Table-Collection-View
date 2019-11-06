//
//  ViewController.swift
//  Senior-Table-Collection-View
//
//  Created by Mohamed samir on 6/2/19.
//  Copyright © 2019 Mohamed samir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var infinteSlider = images
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
    }
    
    //MARK: - tableview
    func setTableView()
    {
        TableView.estimatedRowHeight = 44.0
        TableView.rowHeight = UITableView.automaticDimension
        TableView.backgroundColor = UIColor.clear
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //TableView.register(UINib(nibName: ViewController.cellIdentiferOffersWithSlider, bundle: nil), forCellReuseIdentifier: ViewController.cellIdentiferOffersWithSlider)
        
        TableView.RegisterNib(Cell: MainTableViewCell.self)
        
        //TableView.register(UINib(nibName: ViewController.cellIdentiferSingleSlider, bundle: nil), forCellReuseIdentifier: ViewController.cellIdentiferSingleSlider)
        
        TableView.RegisterNib(Cell: SliderTableViewCell.self)
        
        //TableView.register(UINib(nibName: ViewController.cellIdentifierRestTable, bundle: nil), forCellReuseIdentifier: ViewController.cellIdentifierRestTable)
        
        TableView.RegisterNib(Cell: RestTableViewCell.self)
    
        TableView.reloadData()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.TableView.reloadData()
        self.TableView.beginUpdates()
        self.TableView.endUpdates()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    static let cellIdentiferSingleSlider = "SliderTableViewCell"
    static let cellIdentiferOffersWithSlider = "MainTableViewCell"
    static let cellIdentifierRestTable = "RestTableViewCell"
    //static let cellIdentifierRestTable = "RestTableViewCell"
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1{
            return 1
        }else{
            return infinteSlider.count
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v: UIView = UIView.init()
        v.backgroundColor = UIColor.clear
        return v
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier:  ViewController.cellIdentiferSingleSlider , for: indexPath ) as! BaseTableViewCell
            cell.selectionStyle = .none
            cell.containerVC = self
            cell.reloadData()
            
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier:  ViewController.cellIdentiferOffersWithSlider , for: indexPath ) as! BaseTableViewCell
            cell.selectionStyle = .none
            cell.containerVC = self
            cell.reloadData()
            
            return cell
        }else{
            //let cell = tableView.dequeueReusableCell(withIdentifier:  ViewController.cellIdentifierRestTable , for: indexPath ) as! RestTableViewCell
            
            let cell = tableView.dequeue(IndexPath: indexPath ) as RestTableViewCell
            cell.selectionStyle = .none
            //cell.containerVC = self
            //cell.reloadData()
            cell.myImg.image = infinteSlider[indexPath.row]
            
            return cell
        }
    }
}

extension ViewController : ProductProtocol1
{
    func reloadTable() {
        TableView.reloadData()
        TableView.beginUpdates()
        TableView.endUpdates()
    }
}
protocol ProductProtocol1{
    func reloadTable()
}
