//
//  AppDelegate.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 29/05/2019.
//  Copyright © 2019 MG. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let rootViewController = UIViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }
}
