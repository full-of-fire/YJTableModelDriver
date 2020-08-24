//
//  YJTableModelDriver.swift
//  Pods-YJTableModelDriver_Example
//
//  Created by kern on 8/22/20.
//

import Foundation
import UIKit
public class YJTableModelDriver: NSObject {
    var sections: [SectionConvertable]
    weak var tableView: UITableView?
    
    public init(sections: [SectionConvertable]) {
        self.sections = sections
    }
    
    public func bindTo(tableView: UITableView) {
        self.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
        for section in sections {
            for row in section.rows {
                if row.isNib {
                    tableView.yj_registerNib(nibClass: row.cellClass)
                }else{
                    tableView.yj_registerClass(cellClass: row.cellClass)
                }
            }
        }
    }
}

extension YJTableModelDriver: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard sections.count > section else  { return 0 }
        let rows = sections[section].rows
        return rows.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = row(indexPath: indexPath) else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: row.cellClass.yj_reuseIdentifier, for: indexPath)
        if cell.responds(to: #selector(BindCellableProtocol.bindViewWithData(data:))) {
            cell.perform(#selector(BindCellableProtocol.bindViewWithData(data:)), with: row)
        }
        return cell
    }
    
    
}
extension YJTableModelDriver: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let row = row(indexPath: indexPath) else { return }
        row.didSelectRowAt?(tableView,indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let row = row(indexPath: indexPath) else { return UITableView.automaticDimension }
        guard let heightBlock = row.cellHeight else { return UITableView.automaticDimension }
        return heightBlock()
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionModel = self.section(section: section) else { return nil }
        return sectionModel.headerView?(tableView,section)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let sectionModel = self.section(section: section) else {
            return UITableView.automaticDimension
        }
        return sectionModel.headerViewHeight?(tableView,section) ?? UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let sectionModel = self.section(section: section) else { return nil }
        return sectionModel.footerView?(tableView,section)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let sectionModel = self.section(section: section) else {
            return UITableView.automaticDimension
        }
        return sectionModel.footerViewHeight?(tableView,section) ?? UITableView.automaticDimension
    }
    
}

extension YJTableModelDriver {
    func row(indexPath: IndexPath) -> RowConvertable?{
        guard sections.count > indexPath.section else { return nil }
        let section = sections[indexPath.section]
        guard section.rows.count > indexPath.row else { return nil }
        return section.rows[indexPath.row]
    }
    
    func section(section: Int) -> SectionConvertable? {
        guard sections.count >  section else { return nil }
        return sections[section]
    }
}


@objc public protocol BindCellableProtocol {
    func bindViewWithData(data: Any)
}




fileprivate extension UITableViewCell{
    static  var yj_reuseIdentifier: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
private var YJModelDriverKey = 0
public extension UITableView {
    @objc var modelDriver: YJTableModelDriver? {
        set {
            newValue?.bindTo(tableView: self)
            self.reloadData()
            objc_setAssociatedObject(self, &YJModelDriverKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &YJModelDriverKey) as? YJTableModelDriver
        }
    }
}

fileprivate extension UITableView{
    
    func yj_registerClass(cellClass:UITableViewCell.Type){
        register(cellClass, forCellReuseIdentifier: cellClass.yj_reuseIdentifier)
    }
    
    func yj_registerNib(nibClass:UITableViewCell.Type) {
        register(UINib.init(nibName: nibClass.yj_reuseIdentifier, bundle: Bundle.init(for: nibClass)), forCellReuseIdentifier: nibClass.yj_reuseIdentifier)
    }
}
