//
//  Extension.swift
//  StretchableHeader
//
//  Created by Keith Gapusan on 06/07/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication{
    var statusBarView : UIView?{
        return value(forKey: "statusBar") as? UIView
    }
}
