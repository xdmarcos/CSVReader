//
//  FileDetailInteractor.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileDetailBusinessLogic {

    func doSomething(request: FileDetail.Something.Request)
}

protocol FileDetailDataStore {

    //var name: String { get set }
}

class FileDetailInteractor: FileDetailBusinessLogic, FileDetailDataStore {

    var presenter: FileDetailPresentationLogic?
    var worker: FileDetailWorker?
    //var name: String = ""

    // MARK: Do something
    func doSomething(request: FileDetail.Something.Request) {

        worker = FileDetailWorker()
        worker?.doSomeWork()

        let response = FileDetail.Something.Response()
        presenter?.presentSomething(response: response)
    }
}

// MARK: Output --- Present something
extension FileDetailInteractor {

}
