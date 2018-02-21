//
// Created by Paul Martens on 2018-02-17.
// Copyright (c) 2018 404. All rights reserved.
//

import KYDrawerController
import UIKit

class MenuController: UIViewController {
    enum MenuItemTitle: String {
        case operate = "Operar"
        case myOperations = "Mis operaciones"
        case recentOperations = "Últimas operaciones"
        case market = "Mercado"
    }

    struct MenuItem {
        var title: MenuItemTitle
        var icon: UIImage
        var iconHighlighted: UIImage
    }

    var rootView: MenuView { get { return self.view! as! MenuView } }
    var appDelegate: AppDelegate!
    var menuItems = [MenuItem]()

    override func loadView() {
        self.view = MenuView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.initializeMenuItems()
        self.rootView.tableView.delegate = self
        self.rootView.tableView.dataSource = self
    }

    private func initializeMenuItems() {
        self.menuItems.append(MenuItem(
            title: .operate,
            icon: UIImage(named: "MenuItemOperateIcon")!,
            iconHighlighted: UIImage(named: "MenuItemOperateIconHighlighted")!
        ))
        self.menuItems.append(MenuItem(
            title: .myOperations,
            icon: UIImage(named: "MenuItemMyOperationsIcon")!,
            iconHighlighted: UIImage(named: "MenuItemMyOperationsIconHighlighted")!
        ))
        self.menuItems.append(MenuItem(
            title: .recentOperations,
            icon: UIImage(named: "MenuItemRecentOperationsIcon")!,
            iconHighlighted: UIImage(named: "MenuItemRecentOperationsIconHighlighted")!
        ))
        self.menuItems.append(MenuItem(
            title: .market,
            icon: UIImage(named: "MenuItemMarketIcon")!,
            iconHighlighted: UIImage(named: "MenuItemMarketIconHighlighted")!
        ))
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemViewCell", for: indexPath) as! MenuItemViewCell

        cell.prepare(for: self.menuItems[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = self.menuItems[indexPath.row]

        let drawerController = self.parent! as! KYDrawerController
        let navigationController = drawerController.mainViewController as! UINavigationController
        let topViewController = navigationController.topViewController!
        var mainController: MainController

        switch selectedItem.title {
            case .operate:
                if topViewController is MainController {
                    mainController = topViewController as! MainController
                } else {
                    mainController = MainController()
                    navigationController.replaceTopViewController(with: mainController, animated: false)
                }
                mainController.selectedIndex = 0
            case .myOperations:
                if topViewController is MainController {
                    mainController = topViewController as! MainController
                } else {
                    mainController = MainController()
                    navigationController.replaceTopViewController(with: mainController, animated: false)
                }
                mainController.selectedIndex = 1
            case .recentOperations:
                if topViewController is MainController {
                    mainController = topViewController as! MainController
                } else {
                    mainController = MainController()
                    navigationController.replaceTopViewController(with: mainController, animated: false)
                }
                mainController.selectedIndex = 2
            case .market:
                if topViewController is MainController {
                    mainController = topViewController as! MainController
                } else {
                    mainController = MainController()
                    navigationController.replaceTopViewController(with: mainController, animated: false)
                }
                mainController.selectedIndex = 3
        }

        drawerController.setDrawerState(.closed, animated: true)
    }
}
