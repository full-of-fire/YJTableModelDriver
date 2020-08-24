//
//  ViewController.swift
//  YJTableModelDriver
//
//  Created by full-of-fire on 08/22/2020.
//  Copyright (c) 2020 full-of-fire. All rights reserved.
//

import UIKit
import YJTableModelDriver
class ViewController: UIViewController {
    typealias ClickBlock = () -> Void
    @IBOutlet weak var tableView: UITableView!
    var testBlock: ClickBlock?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let row1 = Row.nibRow(cellClass: MyTableViewCell.self)
        row1.didSelectAt { (table, index) in
            print("index = \(index.row)")
        }
        
        row1.tableHeight { () -> CGFloat in
            return 100
        }
        let row2 = Row.nibRow(cellClass: TestTableViewCell.self)
        
        let section = Section(rows: [row1,row2])
        section.tableHeaderView { (_, _) -> UIView? in
            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
            view.backgroundColor = UIColor.red
            return view
        }
        section.tableHeaderViewHeight { (_, _) -> CGFloat in
            return 100
        }
       
        //初始化
        let modelDriver = YJTableModelDriver(sections: [section])
        tableView.modelDriver = modelDriver

        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

