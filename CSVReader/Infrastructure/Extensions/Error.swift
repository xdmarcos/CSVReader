//
//  Error.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import Foundation

extension Error {

    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
    var localizedDescription: String { return (self as NSError).localizedDescription }
    var userInfo: [String: Any] { return (self as NSError).userInfo }
}
