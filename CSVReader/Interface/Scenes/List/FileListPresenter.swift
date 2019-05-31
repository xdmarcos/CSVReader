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

        let datasource = arrayOfFiles(files: response.files)
        let viewModel = FileList.Retrieve.ViewModel(screenTitle: NSLocalizedString("Your Files", comment: ""), datasource: datasource)
        viewController?.displayFileList(viewModel: viewModel)
    }
}

// MARK: Output --- Display
extension FileListPresenter {

    func arrayOfFiles(files: [String]) -> [File] {

        var fileArray = [File]()
        for file in files {

            let fileInfo = createFileInfo(file: file)
            fileArray.append(fileInfo)
        }

        return fileArray
    }

    func createFileInfo(file: String) -> File {

        guard let fileURL = URL(string: file) else {
            return File(name: "", type: "", path: "")
        }

        let type = fileURL.pathExtension
        var name = fileURL.deletingPathExtension().lastPathComponent
        name = type.isEmpty ? "" : name
        let path = fileURL.absoluteString

        return File(name: name,
                    type: type,
                    path: path)
    }
}
