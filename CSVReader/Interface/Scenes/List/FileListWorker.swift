//
//  FileListWorker.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

class FileListWorker {

    var loadFileListWorker: LoadFileListWorkerAlias = LoadFileListWorker()

    func doGetFileList(fromBundle bundle: String) -> [String] {

        return loadFileListWorker.fileList(fromBundle: bundle)
    }
}
