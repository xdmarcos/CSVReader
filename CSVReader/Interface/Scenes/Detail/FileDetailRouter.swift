//
//  FileDetailRouter.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileDetailRoutingLogic {

    func navigateBack()
}

protocol FileDetailDataPassing {

    var dataStore: FileDetailDataStore? { get }
}

class FileDetailRouter: FileDetailRoutingLogic, FileDetailDataPassing {

    weak var viewController: FileDetailViewController?
    var dataStore: FileDetailDataStore?

    func navigateBack() {
        
        viewController?.navigationController?.popViewController(animated: true)
    }
}
