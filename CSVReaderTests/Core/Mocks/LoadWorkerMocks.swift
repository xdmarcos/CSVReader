//
//  LoadWorkerMocks.swift
//  CSVReaderTests
//
//  Created by Marcos Gonzalez on 2019.
//

@testable import SimpleReader
import XCTest

class LoadWorkerMocks: XCTestCase {

    func fileComplete() -> String {

        let files = loadFixturesContents()
        let path = files.filter { (filepath) -> Bool in

            guard let fileURL = URL(string: filepath) else { return false }
            return fileURL.lastPathComponent == "issues.csv"
        }

        guard let file = path.first else { return "" }
        return file
    }

    func fileEmpty() -> String {

        let files = loadFixturesContents()
        let path = files.filter { (filepath) -> Bool in

            guard let fileURL = URL(string: filepath) else { return false }
            return fileURL.lastPathComponent == "issues_empty.csv"
        }

        guard let file = path.first else { return "" }
        return file
    }
}
