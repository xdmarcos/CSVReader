//
//  FileListInteractor.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileListBusinessLogic {

    func tryRetrieveFileList(request: FileList.Retrieve.Request)
}

protocol FileListDataStore {

    //var name: String { get set }
}

class FileListInteractor: FileListBusinessLogic, FileListDataStore {

    var presenter: FileListPresentationLogic?
    var worker: FileListWorker?
    //var name: String = ""

    // MARK: Do something
    func tryRetrieveFileList(request: FileList.Retrieve.Request) {

        worker = FileListWorker()
        worker?.doSomeWork()

        let response = FileList.Retrieve.Response()
        presenter?.presentFileList(response: response)
    }
}

// MARK: Output --- Present something
extension FileListInteractor {

}
