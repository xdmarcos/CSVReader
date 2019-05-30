//
//  FileListRouter.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileListRoutingLogic {

    func navigateToDetailView(index: Int)
}

protocol FileListDataPassing {

    var dataStore: FileListDataStore? { get }
}

class FileListRouter: FileListRoutingLogic, FileListDataPassing {

    weak var viewController: FileListViewController?
    var dataStore: FileListDataStore?

    // MARK: Routing
    func navigateToDetailView(index: Int) {

        guard let sourceVC = viewController else { return }

        let destinationVC = FileDetailViewController()
        if let sourceDS = dataStore, var destinationDS = destinationVC.router?.dataStore {

            passData(from: sourceDS, to: &destinationDS, selectedIndex: index)
        }

        navigate(from: sourceVC, to: destinationVC)
    }
}

extension FileListRouter {

    // MARK: Passing data

    func passData(from source: FileListDataStore, to destination: inout FileDetailDataStore, selectedIndex: Int?) {

        guard let index = selectedIndex else { return }
        guard let fileName = source.filesList[safe: index] else { return }

        destination.incommingFileName = fileName
    }

    // MARK: Navigation

    func navigate(from source: FileListViewController, to destination: FileDetailViewController) {

        source.navigationController?.pushViewController(destination, animated: true)
    }
}
