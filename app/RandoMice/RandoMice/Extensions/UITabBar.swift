//
// Created by Paul Martens on 2018-02-17.
// Copyright (c) 2018 404. All rights reserved.
//

import UIKit

extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var height: CGFloat = 80

        if #available(iOS 11.0, *) {
            if let view = self.superview {
                if view.safeAreaInsets.bottom > 0.0 {
                    height += self.safeAreaInsets.bottom
                }
            }
        }

        return CGSize(width: UIScreen.main.bounds.width, height: height)
    }
}
