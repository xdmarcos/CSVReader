//
//  FileDetailInteractor.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileDetailBusinessLogic {

    func tryGetFileData(request: FileDetail.Data.Request)
}

protocol FileDetailDataStore {

    var incommingFileName: String { get set }
    var resultingData: [[String]] { get set }
}

class FileDetailInteractor: FileDetailBusinessLogic, FileDetailDataStore {

    var presenter: FileDetailPresentationLogic?
    var worker = FileDetailWorker()
    var incommingFileName = ""
    var resultingData: [[String]] = []

    // MARK: Do
    func tryGetFileData(request: FileDetail.Data.Request) {

        let data = worker.doGetDataFromFile(file: incommingFileName)
        resultingData = data
        
        let response = FileDetail.Data.Response(title: incommingFileName, data: data)
        presenter?.presentFileData(response: response)
    }
}
