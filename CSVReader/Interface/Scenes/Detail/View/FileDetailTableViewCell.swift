//
//  FileDetailTableViewCell.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

class FileDetailTableViewCell: UITableViewCell {

    static let reuseIdentifier = "FileDetailTableViewCellReuseIdentifier"
    private struct ViewTraits {

        // Margins
        static let sideMargin: CGFloat = 10.0
        static let innerMargin: CGFloat = 15.0
        static let vMargin: CGFloat = 5.0

        // Width
        static let wrapperWidth: CGFloat = 150.0

        // Font size
        static let fontBig: CGFloat = 20.0
        static let fontMedium: CGFloat = 16.0
        static let fontSmall: CGFloat = 12.0
    }

    enum Accessibility {

        struct Label {
            static var titleLabel = "titleLabel"
            static var symbolLabel = "symbolLabel"
            static var valueLabel = "valueLabel"
        }
    }

    let titleLabel: UILabel
    let symbolLabel: UILabel
    let valueLabel: UILabel
    private let nameWrapper: UIView

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        //titleLabel
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: ViewTraits.fontBig)
        titleLabel.textColor = .appDarkGray
        titleLabel.accessibilityLabel = Accessibility.Label.titleLabel

        //symbolLabel
        symbolLabel = UILabel()
        symbolLabel.font = UIFont.boldSystemFont(ofSize: ViewTraits.fontSmall)
        symbolLabel.textColor = .appDarkGray
        symbolLabel.accessibilityLabel = Accessibility.Label.symbolLabel

        //valueLabel
        valueLabel = UILabel()
        valueLabel.font = UIFont.systemFont(ofSize: ViewTraits.fontMedium)
        valueLabel.textColor = .appDarkGray
        valueLabel.textAlignment = .right
        valueLabel.accessibilityLabel = Accessibility.Label.valueLabel

        //nameWrapper
        nameWrapper = UIView()

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        backgroundColor = .appWhite

        // Add subviews
        nameWrapper.addSubviewsForAutolayout(subviews: [titleLabel, symbolLabel])
        addSubviewsForAutolayout(subviews: [nameWrapper, valueLabel])

        // Add constraints
        addCustomConstraints()
    }

    override func prepareForReuse() {

        super.prepareForReuse()

        titleLabel.text = ""
        symbolLabel.text = ""
        valueLabel.text = ""
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addCustomConstraints() {

        NSLayoutConstraint.activate([

            nameWrapper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewTraits.sideMargin),
            nameWrapper.widthAnchor.constraint(equalToConstant: ViewTraits.wrapperWidth),
            nameWrapper.topAnchor.constraint(equalTo: topAnchor),
            nameWrapper.bottomAnchor.constraint(equalTo: bottomAnchor),

            valueLabel.leadingAnchor.constraint(equalTo: nameWrapper.trailingAnchor, constant: ViewTraits.innerMargin),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ViewTraits.sideMargin),
            valueLabel.topAnchor.constraint(equalTo: topAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: nameWrapper.leadingAnchor, constant: ViewTraits.sideMargin),
            titleLabel.trailingAnchor.constraint(equalTo: nameWrapper.trailingAnchor, constant: -ViewTraits.sideMargin),
            titleLabel.topAnchor.constraint(equalTo: nameWrapper.topAnchor, constant: ViewTraits.vMargin),

            symbolLabel.leadingAnchor.constraint(equalTo: nameWrapper.leadingAnchor, constant: ViewTraits.sideMargin),
            symbolLabel.trailingAnchor.constraint(equalTo: nameWrapper.trailingAnchor, constant: -ViewTraits.sideMargin),
            symbolLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            symbolLabel.bottomAnchor.constraint(equalTo: nameWrapper.bottomAnchor, constant: -ViewTraits.vMargin),
            symbolLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor)])
    }
}
