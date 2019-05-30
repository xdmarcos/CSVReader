//
//  String.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import  UIKit

extension String {

    func toDate() -> Date? {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z"
        
        return dateFormatter.date(from: self)
    }
}
