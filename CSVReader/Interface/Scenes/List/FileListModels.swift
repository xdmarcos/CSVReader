//
//  FileListModels.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

enum FileList {

    // MARK: Use cases
    enum Retrieve {

        struct Request {
        }

        struct Response {
        }

        struct ViewModel {
            let screenTitle: String
            let numberOfSections = 1
            let datasource: [String]
        }
    }
}
