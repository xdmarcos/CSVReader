//
//  FileDetailModels.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

enum FileDetail {

    enum Header: Int {
        case name = 0
        case surname
        case count
        case dob
    }

    // MARK: Use cases
    enum Data {

        struct Request {
        }

        struct Response {
            let title: String
            let data: [[String]]
        }

        struct ViewModel {

            let screenTitle: String
            let headerValues: [String]
            let datasource: [Issue]
        }
    }
}
