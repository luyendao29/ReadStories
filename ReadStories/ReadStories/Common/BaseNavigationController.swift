//
//  BaseNavigationController.swift
//  ReadStories
//
//  Created by Boss on 17/08/2021.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        let attrs = [
            
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 17)!
        ]
        
        UINavigationBar.appearance().titleTextAttributes = attrs
        navigationBar.tintColor = .white
    }
}
