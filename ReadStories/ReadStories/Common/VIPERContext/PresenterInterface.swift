//
//  PresenterInterface.swift
//  ReadStories
//
//  Created by Boss on 16/08/2021.
//

import Foundation

@objc public protocol PresenterInterface: AnyObject {
    @objc optional func viewDidLoad()
    @objc optional func viewWillAppear(animated: Bool)
    @objc optional func viewDidAppear(animated: Bool)
    @objc optional func viewWillDisappear(animated: Bool)
    @objc optional func viewDidDisappear(animated: Bool)
    @objc optional func prepare(for segue: AnyObject, sender: Any?)
}

extension PresenterInterface {
}
