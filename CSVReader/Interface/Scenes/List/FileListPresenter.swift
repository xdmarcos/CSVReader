//
//  FileListPresenter.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileListPresentationLogic {

    func presentFileList(response: FileList.Retrieve.Response)
}

class FileListPresenter: FileListPresentationLogic {

    weak var viewController: FileListDisplayLogic?

    // MARK: Do something
    func presentFileList(response: FileList.Retrieve.Response) {
        
        let viewModel = FileList.Retrieve.ViewModel(screenTitle: NSLocalizedString("File List", comment: ""), datasource: ["File1"])
        viewController?.displayFileList(viewModel: viewModel)
    }
}

// MARK: Output --- Display something
extension FileListPresenter {

}
