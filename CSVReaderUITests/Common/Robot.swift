//
//  Robot.swift
//  CSVReaderTests
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

@testable import SimpleReader

class Robot {

    var tester: KIFUITestActor?

    private var rootViewController: UIViewController? {

        get {

            return UIApplication.shared.keyWindow?.rootViewController
        }

        set(newRootVC) {

            UIApplication.shared.keyWindow?.rootViewController = newRootVC
        }
    }

    init(test: XCTestCase) {

        UIView.setAnimationsEnabled(false)
        self.tester = test.tester()
    }

    deinit {

        tester = nil
    }

    func present(viewController: UIViewController) {

        rootViewController = viewController
    }

    @discardableResult func pushRoot(viewController: UIViewController) -> UINavigationController {

        let navigationController = UINavigationController(rootViewController: viewController)
        rootViewController = navigationController

        return navigationController
    }
}
