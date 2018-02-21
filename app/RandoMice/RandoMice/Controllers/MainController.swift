//
// Created by Paul Martens on 2018-02-17.
// Copyright (c) 2018 404. All rights reserved.
//

import UIKit

class MainController: SwipeableTabBarController {
    struct Tab {
        var title: String
        var icon: UIImage?
    }

    private let tabs: [Tab] = [
        Tab(title: "Foo", icon: UIImage(named: "TabSampleIcon")),
        Tab(title: "Deal", icon: UIImage(named: "TabDealIcon")),
        Tab(title: "Build", icon: UIImage(named: "TabBuildIcon")),
    ]
    private let tabHeight: CGFloat = 80
    private var tabWidth: CGFloat { get { return UIScreen.main.bounds.width / CGFloat(self.tabs.count) } }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewControllers([
            FakeController(),
            FakeController(),
            BuildController()
        ], animated: true)

        self.setupTabBarStyles()

        for (position, tab) in self.tabs.enumerated() {
            let item = self.tabBar.items![position]
            item.image = tab.icon
            item.setTitleTextAttributes([.font: UIFont(name: "STHeitiSC-Medium", size: 12)!], for: .normal)
            item.title = tab.title
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)
        }
    }

    private func setupTabBarStyles() {
        self.tabBar.barTintColor = UIColor(hexString: "#003340")
        self.tabBar.isTranslucent = false
        self.tabBar.itemPositioning = .automatic
        self.tabBar.tintColor = .orange
        self.tabBar.unselectedItemTintColor = UIColor(hexString: "#999999")
        self.tabBar.selectionIndicatorImage = createSelectionIndicator(color: .orange)
    }

    private func createSelectionIndicator(color: UIColor) -> UIImage {
        let lineWidth = CGFloat(4)
        let size = CGSize(width: self.tabWidth * 0.95, height: self.tabHeight)

        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: size.height - lineWidth, width: size.width, height: lineWidth))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image!
    }
}
