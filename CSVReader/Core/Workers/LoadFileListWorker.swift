//
//  LoadFileListWorker.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol LoadFileListWorkerAlias {

    func fileList(fromBundle bundle: String) -> [String]
}
class LoadFileListWorker: LoadFileListWorkerAlias {

    private static let fileType = ".csv"
    private let fileManager = FileManager.default
    func fileList(fromBundle bundle: String) -> [String] {

        guard let filesBundle = Bundle(path: Bundle.main.path(forResource: bundle, ofType: ".bundle") ?? "") else { return [] }

        let files = filesBundle.paths(forResourcesOfType: LoadFileListWorker.fileType, inDirectory: ".")
        DLog("\(files)")

        return files
    }
}
