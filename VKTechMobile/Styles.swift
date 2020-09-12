//
//  Styles.swift
//  VKTechMobile
//
//  Created by Lev Butkovskiy on 11.09.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

public let VKBorderRadius = CGFloat(10)

class Styles: NSObject {
}

extension UIColor {
    class var VKColor_Description: UIColor {
      return UIColor(red: 129.0/255.0, green: 140.0/255.0, blue: 153.0/255.0, alpha: 1.0)
    }
    
    class var VKColor_Subtitle: UIColor {
        return UIColor(red: 109.0/255.0, green: 120.0/255.0, blue: 133.0/255.0, alpha: 1.0)
    }
    
    class var VKColor_Block: UIColor {
      return UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
    }
    
    class var VKColor_InputBackground: UIColor {
      return UIColor(red: 242.0/255.0, green: 243.0/255.0, blue: 245.0/255.0, alpha: 1.0)
    }
    
    class var VKColor_Placeholder: UIColor {
      return UIColor(red: 129.0/255.0, green: 140.0/255.0, blue: 153.0/255.0, alpha: 1.0)
    }
    
    class var VKColor_PlaceholderBorder: UIColor {
        return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.12)
    }
    
    class var VKColor_Button: UIColor {
      return UIColor(red: 73.0/255.0, green: 134.0/255.0, blue: 204.0/255.0, alpha: 1.0)
    }
    
    class var VKColor_Icon: UIColor {
        return UIColor(red: 63.0/255.0, green: 138.0/255.0, blue: 224.0/255.0, alpha: 1.0)
    }
    
    class var VKColor_Chevron: UIColor {
        return UIColor(red: 184.0/255.0, green: 193.0/255.0, blue: 204.0/255.0, alpha: 1.0)
    }
    
}

extension UIFont {
    class var NavigationBarFont: UIFont {
      return UIFont.systemFont(ofSize: 21, weight: UIFont.Weight.bold)
    }
}

extension UIImage {
    class var VKIcon_Target: UIImage {
        return UIImage(named: "target")!
    }
    
    class var VKIcon_Calendar: UIImage {
        return UIImage(named: "calendar")!
    }
    
    class var VKIcon_Picture: UIImage {
        return UIImage(named: "picture")!
    }
    
    class var VKIcon_CancelCircle: UIImage {
        return UIImage(named: "cancel_circle")!
    }
    
    class var VKIcon_Dismiss: UIImage {
        return UIImage(named: "dismiss_dark")!
    }
    
    class var VKIcon_ChevroneLeft: UIImage {
        return UIImage(named: "chevron_left")!
    }
    
    class var VKIcon_ChevroneRight: UIImage {
        return UIImage(named: "chevron_right")!
    }

    class var VKIcon_ChevroneDown: UIImage {
        return UIImage(named: "chevron_down")!
    }
    
    class var VKIcon_RadioButtonON: UIImage {
        return UIImage(named: "radio_1")!
    }
    
    class var VKIcon_RadioButtonOFF: UIImage {
        return UIImage(named: "radio_0")!
    }
}

