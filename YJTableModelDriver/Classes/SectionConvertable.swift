//
//  SectionConvertable.swift
//  Pods-YJTableModelDriver_Example
//
//  Created by kern on 8/22/20.
//

import Foundation
import UIKit
public protocol SectionConvertable: class {
    var rows: [RowConvertable] { set get }
    
    var footerView: ((UITableView, Int) -> UIView?)? { set get }
    var footerViewHeight: ((UITableView, Int) -> CGFloat)? { set get}
    
    var headerView: ((UITableView,Int) -> UIView?)? { set get}
    var headerViewHeight: ((UITableView,Int) -> CGFloat)? { set get }
    
    //optional
    func tableFooterView(_ block: @escaping (UITableView,Int) -> UIView?)
    func tableFooterViewHeight(_ block: @escaping (UITableView,Int) -> CGFloat)
    
    func tableHeaderView(_ block: @escaping (UITableView,Int) -> UIView?)
    func tableHeaderViewHeight(_ block: @escaping (UITableView,Int) -> CGFloat)
    
}

extension SectionConvertable {
    public func tableFooterView(_ block: @escaping (UITableView,Int) -> UIView?) {
        footerView = block
    }
    
    public func tableFooterViewHeight(_ block: @escaping (UITableView,Int) -> CGFloat) {
        footerViewHeight = block
    }
    
    public func tableHeaderView(_ block: @escaping (UITableView,Int) -> UIView?) {
        headerView =  block
    }
    public func tableHeaderViewHeight(_ block: @escaping (UITableView,Int) -> CGFloat) {
        headerViewHeight = block
    }
}

