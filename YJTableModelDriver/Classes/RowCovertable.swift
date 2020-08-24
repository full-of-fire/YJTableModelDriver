//
//  RowCovertable.swift
//  Pods-YJTableModelDriver_Example
//
//  Created by kern on 8/22/20.
//

import Foundation
import UIKit
public protocol RowConvertable: class {
    var cellClass: UITableViewCell.Type { set  get }
    var isNib: Bool { set get }
    var cellHeight: (() -> CGFloat)? { set get }
    var didSelectRowAt: ((UITableView, IndexPath) -> Void)? { set get }
    // optional
    func didSelectAt(_ block: @escaping (UITableView,IndexPath) -> Void)
    func tableHeight(_ block: @escaping () -> CGFloat)
}

extension RowConvertable {
    public func didSelectAt(_ block: @escaping (UITableView,IndexPath) -> Void) {
        didSelectRowAt = block
    }
    
    public func tableHeight(_ block: @escaping () -> CGFloat) {
        cellHeight = block
    }
}
