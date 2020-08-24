//
//  Row.swift
//  YJTableModelDriver_Example
//
//  Created by kern on 8/23/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import YJTableModelDriver
class Row: NSObject,RowConvertable {

    var cellHeight: (() -> CGFloat)?
    var isNib: Bool = false
    var cellClass: UITableViewCell.Type
    var didSelectRowAt: ((UITableView, IndexPath) -> Void)?
    
    //自定义属性
    var title = "我需要改变世界"

    init(cellClass: UITableViewCell.Type) {
        self.cellClass = cellClass
    }
    class func row(cellClass: UITableViewCell.Type) -> Row {
        return Row(cellClass: cellClass)
    }
    
    class func nibRow(cellClass: UITableViewCell.Type) -> Row {
        let row = Row(cellClass: cellClass)
        row.isNib = true
        return row
    }
    
}
