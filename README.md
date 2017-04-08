![Berry: Drop down menu in Swift](http://7xie11.com1.z0.glb.clouddn.com/Group.png)

[![CocoaPods Compatible](https://img.shields.io/badge/pod-v1.2.0-blue.svg)](https://img.shields.io/badge/pod-v1.2.0-blue.svg)
[![License](https://raw.githubusercontent.com/ShiWeiCN/Berry/master/LICENSE)](https://img.shields.io/badge/license-MIT-000000.svg)
[![Platform](https://img.shields.io/badge/platform-ios 8.0+-lightgrey.svg)](https://img.shields.io/badge/platform-ios 8.0+-lightgrey.svg)
[![Xcode](https://img.shields.io/badge/Xcode 8-Swift 3.1-red.svg)](https://img.shields.io/badge/Xcode 8-Swift 3.1-red.svg)


**Berry** is an drop down menu written by Swift 3.1.

- [Screen Shots](#screenshots)
- [Usage](#usage)
    - [Menu item](#menuitem)
    - [Theme](#theme)
    - [Selected handler](#selectedhandler)
    - [Navigation Title View](#navigationtitleview)
    - [Show & hide](#show&hide)
- [Installation](#installation)
- [ToDo](#todo)
- [License](#license)

## ScreenShots

![Screen shots](Gif/berry.gif)

## Usage

```swift
if useCocoapods
    print("import Berry 😆")

```

### Menu item

If your menu just need one column, you need to set menu cell title/icon/iconHighlight(unnecessary).

```swift
let items: [BerryMenuItem] = [
   BerryMenuItem("Popular", icon: "", iconHighlight: ""),
   BerryMenuItem("Recent", icon: "", iconHighlight: "")
]
```

If your menu has more than one columns, you should set the same properties above and subItem, like this

```swift
BerryMenuItem("Name", icon: "", iconHighlight: "", menuSubItem: subItem)
```

### Theme

#### Default Theme

**Berry** provide you one default theme, you can see that on [Example](https://github.com/ShiWeiCN/Berry)

You need an **`Array<Int>`** to record the selected state.

```swift
let berry = BerryView(navigationController: navigationController,
                      containerView: view,
                      selectedIndex: [selectedStageIndex],
                      items: items)
```

#### Custom Theme

But if you want to customize your own drop down menu, **Berry** also provide so many properties.

> BerryMenuProperty

```swift
/// The color of menu title
public var menuTitleColor: UIColor
    
/// The font of menu title **default** is **systemFont(ofSize: 16)**
public var menuTitleFont: UIFont
    
/// The max number of rows showing on the menu, default is **5**
public var menuMaxShowingRows: Int
    
/// The number of column on the menu, default is **1**
public var menuColumns: Int
    
/// The menu table view background color
public var menuBackgroundColor: UIColor

```

> BerryCellProperty

```swift
/// Menu cell style default style is none of image on cell
public var cellStyle: BerryCellStyle
    
/// Menu cell height **default 44.0**
public var cellHeight: CGFloat
    
/// Menu cell backgroundColor
public var cellBackgroundColor: UIColor
    
/// Menu cell seapartor line background color
public var cellSeparatorColor: UIColor
    
/// Menu cell text label color
public var cellTextLabelColor: UIColor
    
/// Menu cell text label font
public var cellTextLabelFont: UIFont
    
/// Menu cell selected background color default is nil
/// if nil will not set selected background color
public var cellSelectedBackgroundColor: UIColor?
    
/// Menu cell when selected the text label color will change
public var cellSelectedTextLabelColor: UIColor
    
/// Text alignment default is **CENTER**
public var cellTextLabelAlignment: NSTextAlignment
    
public var hideVerticalSeparator: Bool
```

> BerryArrowProperty

```swift
public var arrowTintColor: UIColor
    
/// Arrow padding default is 10
public var arrowPadding: CGFloat
    
/**
* Arrow image which one will be showed on the navigation bar
*
* Default is nil
*
* if nil will not set arrow image
*/
public var arrowImage: String?
```

> BerryMaskProperty

```swift
/// Background Color of mask view
public var maskBackgroundColor: UIColor
    
/// Opacity mask background view
public var maskBackgroundOpacity: CGFloat
```

> BerryOtherProperty

```swift
/// Animation duration **default 0.375**
public var duration: TimeInterval
    
/// Change title text when menu cell was selected
public var shouldChangeTitleText: Bool
    
/// Change the color of menu's cell while cell was selected
public var shouldKeepSelectedCellColor: Bool
```

On `BerryConfig`, combine all above property struct

```swift
public var menuProperty: BerryMenuProperty
public var cellProperty: BerryCellProperty 
public var arrowProperty: BerryArrowProperty 
public var maskProperty: BerryMaskProperty 
public var otherProperty: BerryOtherProperty
```

For custom theme

```swift
let config = BerryConfig.default()
config.menuProperty.menuColumns = 3
config.menuProperty.menuMaxShowingRows = 7
config.cellProperty.hideVerticalSeparator = false
   
let berry = BerryView(navigationController: navigationController,
                    containerView: view,
                    selectedIndex: selectedStageIndex,
                    items: items,
                    config: config)
```

### Selected handler

```swift
berry.didSelectedRowsAtIndexPath = { (column: Int, row: Int) in
    
}
```

### Navigation Title View

If you want to change the navigation title while selected different menu, you need set the navigation item's title view to Berry instance.

```swift
navigationItem.titleView = berry
```

### Show & Hide

Show drop down menu

```swift
public func show()
```

Hide drop down ment

```swift
public func dismiss()
```

## Installation

### Cocoapods

**Berry** is available through [Cocoapods](https://cocoapods.org/).

Add the following line to your `Podfile`

```
pod 'Berry'
```

### Manually

Downloads the berry zip, copy all swift file on the **Source** folder to your project.

## ToDO

- [ ] More animation
- [ ] More styles

## License

**Berry** is released under the MIT license. See LICENSE for details.






