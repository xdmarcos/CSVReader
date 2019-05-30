//
//  AppDelegate.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let rootViewController = FileListViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        changeNavigationBarAppearance()

        return true
    }

    // MARK: Private
    private func changeNavigationBarAppearance() {

        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = .appWhite
        navigationBarAppearace.barStyle = .black
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.backgroundColor = .appBlack
        navigationBarAppearace.barTintColor = .appBlack
        navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.largeTitlesFont()]
    }
}
