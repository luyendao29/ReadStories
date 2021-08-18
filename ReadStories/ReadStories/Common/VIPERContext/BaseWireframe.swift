/**
 * Copyright (C) 2020 NTT DOCOMO, INC. All Rights Reserved.
 */

import UIKit

@objc public protocol WireframeInterface: AnyObject {
    @objc optional func prepare(for segue: AnyObject, sender: Any?)
}

open class BaseWireframe {
    private unowned var _viewController: UIViewController

    public init(viewController: UIViewController, parameters: [String: Any]? = nil) {
        _viewController = viewController
    }
}

extension BaseWireframe: WireframeInterface {}

extension BaseWireframe {
    public var viewController: UIViewController {
        return _viewController
    }

    public var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

extension UIViewController {
    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
}

extension UINavigationController {
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        pushViewController(wireframe.viewController, animated: animated)
    }

    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        setViewControllers([wireframe.viewController], animated: animated)
    }
}


