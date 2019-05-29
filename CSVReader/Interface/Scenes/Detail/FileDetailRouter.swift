//
//  FileDetailRouter.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileDetailRoutingLogic {

    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol FileDetailDataPassing {

    var dataStore: FileDetailDataStore? { get }
}

class FileDetailRouter: FileDetailRoutingLogic, FileDetailDataPassing {

    weak var viewController: FileDetailViewController?
    var dataStore: FileDetailDataStore?

    // MARK: Routing
    
//    func routeToSomewhere(segue: UIStoryboardSegue?) {
//
//        let destinationVC = SomewhereViewController()
//        if let sourceDS = dataStore, var destinationDS = destinationVC.router?.dataStore {
//
//            passData(from: sourceDS, to: &destinationDS)
//        }
//
//        if let sourceVC = viewController {
//            navigate(from: sourceVC, to: destinationVC)
//        }
//    }
//
//    // MARK: Navigation
//
//    func navigate(from source: FileDetailViewController, to destination: SomewhereViewController) {
//
//        source.show(destination, sender: nil)
//    }
//
//    // MARK: Passing data
//
//    func passData(from source: FileDetailDataStore, to destination: inout SomewhereDataStore) {
//
//        destination.name = source.name
//    }
}
