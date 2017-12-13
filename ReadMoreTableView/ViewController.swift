//
//  ViewController.swift
//  ReadMoreTableView
//
//  Created by Nitin Bhatia on 13/12/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var table: UITableView!
    var x : ReadMoreTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        x = ReadMoreTableView(tableView: table)
        table.delegate = x
        table.dataSource = x
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

