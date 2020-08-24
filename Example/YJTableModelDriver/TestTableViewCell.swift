//
//  TestTableViewCell.swift
//  YJTableModelDriver_Example
//
//  Created by kern on 8/23/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import YJTableModelDriver
class TestTableViewCell: UITableViewCell,BindCellableProtocol {
    
    func bindViewWithData(data: Any) {
        guard let row = data as? Row else { return }
        print(row)
    }
}
