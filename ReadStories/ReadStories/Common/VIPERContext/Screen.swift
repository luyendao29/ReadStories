//
//  Screen.swift
//  ReadStories
//
//  Created by Boss on 16/08/2021.
//

import Foundation

import Foundation
import UIKit

struct Screen {
    static let width: Float = Float(UIScreen.main.bounds.size.width)
    static let height: Float = Float(UIScreen.main.bounds.size.height)
    
    static let menuWidth: Float = 215.0
    static let navigationHeight: Float = 44.0
    static let navigationStatusBarHeight: Float = 20.0
    static let tabbarHeight: Float = 44.0
    
    struct iPhone4 {
        static let width: Float = 320
        static let height: Float = 480
    }
    
    struct iPhone5 {
        static let width: Float = 320
        static let height: Float = 568
    }
    
    struct iPhone6 {
        static let width: Float = 375
        static let height: Float = 667
    }
    
    struct iPhone6p {
        static let width: Float = 414
        static let height: Float = 736
    }
    
    struct iPhoneX {
        static let width: Float = 375
        static let height: Float = 812
    }
}

