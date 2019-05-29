//
//  UIView.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit.UIView

extension UIView {

    func addSubviewForAutolayout(subview: UIView) {

        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
    }

    func addSubviewsForAutolayout(subviews: [UIView]) {

        for subview in subviews {

            subview.translatesAutoresizingMaskIntoConstraints = false
            addSubview(subview)
        }
    }
}
