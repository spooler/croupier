//
// Created by Paul Martens on 2018-02-17.
// Copyright (c) 2018 404. All rights reserved.
//

import KYDrawerController
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var masterSets: [MasterSetKey: Set]!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        self.masterSets = [
            .spanishDeck: SetFixtures.getSpanishDeck(),
            .frenchDeck: SetFixtures.getFrenchDeck(),
            .dice: SetFixtures.getDice()
        ]

        self.startMainNavigation()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    public func startMainNavigation() {
        let navigationController = UINavigationController(rootViewController: MainController())
        let menuController = MenuController()
        let drawerController = KYDrawerController(drawerDirection: .left, drawerWidth: 283)

        drawerController.mainViewController = navigationController
        drawerController.drawerViewController = menuController

        window!.rootViewController = drawerController
        window!.backgroundColor = .white

        // Close keyboard or picker on view touch
        let tapGestureRecognizer = UITapGestureRecognizer(target: drawerController.view, action: #selector(UIView.endEditing))
        tapGestureRecognizer.cancelsTouchesInView = false
        drawerController.view.addGestureRecognizer(tapGestureRecognizer)

        window!.makeKeyAndVisible()
    }
}
