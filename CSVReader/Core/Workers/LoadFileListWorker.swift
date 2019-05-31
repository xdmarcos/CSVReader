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

    private static let fileType = "csv"
    private let fileManager = FileManager.default
    func fileList(fromBundle bundle: String) -> [String] {

        let mainBundle = Bundle(for: type(of: self))
        let bundleURL = mainBundle.url(forResource: bundle, withExtension: "bundle")
        guard let bURL = bundleURL, let filesBundle = Bundle(url: bURL) else { return [] }

        let files = filesBundle.paths(forResourcesOfType: LoadFileListWorker.fileType, inDirectory: ".")
        DLog("\(files)")

        return files
    }
}
