# YJTableModelDriver

[![CI Status](https://img.shields.io/travis/full-of-fire/YJTableModelDriver.svg?style=flat)](https://travis-ci.org/full-of-fire/YJTableModelDriver)
[![Version](https://img.shields.io/cocoapods/v/YJTableModelDriver.svg?style=flat)](https://cocoapods.org/pods/YJTableModelDriver)
[![License](https://img.shields.io/cocoapods/l/YJTableModelDriver.svg?style=flat)](https://cocoapods.org/pods/YJTableModelDriver)
[![Platform](https://img.shields.io/cocoapods/p/YJTableModelDriver.svg?style=flat)](https://cocoapods.org/pods/YJTableModelDriver)

## Example

1. To run the example project, clone the repo, and run `pod install` from the Example directory first.
2. `Row`实现`RowConvertable`协议 ，`Section`实现`SectionConvertable`协议
``` swift
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

```
2. `UITableViewCell`数据绑定，需要实现`BindCellableProtocol`协议
```swift
class TestTableViewCell: UITableViewCell,BindCellableProtocol {
    
    func bindViewWithData(data: Any) {
        guard let row = data as? Row else { return }
        print(row)
    }
}
```

## Requirements

## Installation

YJTableModelDriver is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YJTableModelDriver'
```

## Author

full-of-fire, 591730822@qq.com

## License

YJTableModelDriver is available under the MIT license. See the LICENSE file for more info.
