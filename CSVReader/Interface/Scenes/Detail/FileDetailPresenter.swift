//
//  FileDetailPresenter.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileDetailPresentationLogic {

    func presentSomething(response: FileDetail.Something.Response)
}

class FileDetailPresenter: FileDetailPresentationLogic {

    weak var viewController: FileDetailDisplayLogic?

    // MARK: Do something
    func presentSomething(response: FileDetail.Something.Response) {
        
        let viewModel = FileDetail.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}

// MARK: Output --- Display something
extension FileDetailPresenter {

}
