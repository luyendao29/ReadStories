//
//  Loading.swift
//  ReadStories
//
//  Created by Boss on 16/08/2021.
//

import UIKit

// loading animation
final class Loading {
    static var loading = UIImageView(frame: CGRect.init(x: Int(Screen.width/2 - 32), y: Int(Screen.height/2 - 32), width: 64, height: 64))
    var bgView = UIView(frame: CGRect.init(x: 0, y: 0, width: Int(Screen.width), height: Int(Screen.height)))
    
    
    final func start(_ currentView: UIViewController? = UIApplication.getTopViewController()) -> Void {
        if let topVC = currentView {
            bgView.backgroundColor = UIColor.clear
            Loading.loading.backgroundColor = UIColor.clear
            Loading.loading.isOpaque = false
            bgView.addSubview(Loading.loading)
            topVC.view.addSubview(bgView)
        } else if currentView == nil, let topVC = UIApplication.getTopViewController() {
            bgView.backgroundColor = UIColor.clear
            Loading.loading.backgroundColor = UIColor.clear
            Loading.loading.isOpaque = false
            bgView.addSubview(Loading.loading)
            topVC.view.addSubview(bgView)
        }
        
        Loading.loading.image = UIImage(named: "new-loading-icon")
        Loading.loading.rotate()
    }
    
    final func stop() -> Void {
        Loading.loading.stopRotating()
        bgView.removeFromSuperview()
    }
}

extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}

extension UIView {
    private static let kRotationAnimationKey = "rotationanimationkey"

    func rotate(duration: Double = 1) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")

            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity

            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }

    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }
}
