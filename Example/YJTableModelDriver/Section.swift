//
//  Section.swift
//  YJTableModelDriver_Example
//
//  Created by kern on 8/23/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import YJTableModelDriver
class Section: SectionConvertable {
    var footerView: ((UITableView, Int) -> UIView?)?
    
    var footerViewHeight: ((UITableView, Int) -> CGFloat)?
    
    var headerView: ((UITableView, Int) -> UIView?)?
    
    var headerViewHeight: ((UITableView, Int) -> CGFloat)?
    
    var rows: [RowConvertable]
    
    init(rows: [RowConvertable]) {
        self.rows = rows
    }

}
