//
//  FileListView.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

class FileListView: UIView {

    private struct ViewTraits {

        // Margins
        static let tableContentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 20.0, right: 0.0)
        //TV
        static let estimatedRowHeight: CGFloat = 80
    }

    // MARK: Public
    let tableView: UITableView

    override init(frame: CGRect) {

        //tableView
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .appWhite
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = ViewTraits.estimatedRowHeight
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInset = ViewTraits.tableContentInset

        // Init
        super.init(frame: frame)

        backgroundColor = .appWhite

        // Add subviews
        addSubviewForAutolayout(subview: tableView)

        // Add constraints
        addCustomConstraints()
    }

    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

    private func addCustomConstraints() {

        NSLayoutConstraint.activate([

            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }
}