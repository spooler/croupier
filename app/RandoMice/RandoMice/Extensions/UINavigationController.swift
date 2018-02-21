//
// Created by Paul Martens on 2018-02-17.
// Copyright (c) 2018 404. All rights reserved.
//

import UIKit

extension UINavigationController {
    func replaceTopViewController(with viewController: UIViewController, animated: Bool) {
        var viewControllers = self.viewControllers
        viewControllers[viewControllers.count - 1] = viewController
        self.setViewControllers(viewControllers, animated: animated)
    }
}
