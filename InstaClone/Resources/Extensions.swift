//
//  Extensions.swift
//  InstaClone
//
//  Created by Sarthak Mishra on 08/08/21.
//

import Foundation
import UIKit

extension UIView {
    
    public var width:CGFloat{
        return frame.size.width
    }
    
    public var height:CGFloat{
        return frame.size.height
    }
    
    public var top:CGFloat{
        return frame.origin.y
    }
    
    public var bottom:CGFloat{
        return top + frame.size.height
    }
    
    public var left:CGFloat{
        return frame.origin.y
    }
    
    public var right:CGFloat{
        return left + frame.size.width
    }
}


extension String{
    
     func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
    }
    
}
