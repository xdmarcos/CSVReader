//
//  XCTestCaseExtensions.swift
//  CSVReaderTests
//
//  Created by Marcos Gonzalez on 2019.
//

import XCTest

extension XCTestCase {

    func waitForExpectations() {

        waitForExpectations(timeout: 3) { (error) in

            XCTAssertNil(error, "Expected no timeout error, found \(String(describing: error))")
        }
    }

    func loadFixturesContents() -> [String] {

        guard let testBundle = fixturesBundle() else {

            XCTFail("can't load test fixtures bundle")
            return []
        }

        return testBundle.paths(forResourcesOfType: "csv", inDirectory: ".")
    }

    func loadFixtureFileData(fromFile file: String) -> [[String]] {

        let data = readDataFromCSV(fileName: file)
        var result = [[String]]()
        let rows = data.components(separatedBy: "\n").filter { (component) -> Bool in
            return !component.isEmpty
        }

        for row in rows {

            let columns = row.components(separatedBy: ",")
            result.append(columns)
        }

        return result
    }

    func fixturesBundle() -> Bundle? {

        let bundle = Bundle(for: type(of: self))
        let bundleUrl = bundle.url(forResource: "Test", withExtension: "bundle")
        if let bundleUrl = bundleUrl, let fixturesBundle = Bundle(url: bundleUrl) {

            return fixturesBundle
        } else {

            return nil
        }
    }

    private func readDataFromCSV(fileName: String) -> String {

        do {
            var contents = try String(contentsOfFile: fileName, encoding: .utf8)
            contents = cleanRows(file: contents)

            return contents
        } catch {
            return ""
        }
    }

    private func cleanRows(file: String) -> String {

        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\"", with: "")

        return cleanFile
    }
}
