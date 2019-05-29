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

        let detailVC = FileDetailViewController()
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
