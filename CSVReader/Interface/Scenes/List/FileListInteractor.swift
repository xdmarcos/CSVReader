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

    var filesList: [String] { get set }
}

class FileListInteractor: FileListBusinessLogic, FileListDataStore {

    var presenter: FileListPresentationLogic?
    var worker = FileListWorker()
    var filesList: [String] = []

    // MARK: Do
    func tryRetrieveFileList(request: FileList.Retrieve.Request) {

        let files = worker.doGetFileList(fromBundle: AppConfig.bundleName)
        filesList = files
        
        let response = FileList.Retrieve.Response(files: files)
        presenter?.presentFileList(response: response)
    }
}
