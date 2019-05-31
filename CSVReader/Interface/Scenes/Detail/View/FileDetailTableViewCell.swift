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
        static let cellMargins = UIEdgeInsets(top: 15.0, left: 10.0, bottom: 15.0, right: 10.0)
        static let innerMargin: CGFloat = 10.0
        static let vMargin: CGFloat = 5.0

        //Size
        static let labelWidth: CGFloat = 130.0

        // Font size
        static let fontMedium: CGFloat = 16.0
        static let fontSmall: CGFloat = 12.0
    }

    enum Accessibility {

        struct Identifier {
            static var nameLabel = "nameLabel"
            static var nameValueLabel = "nameValueLabel"
            static var surnameLabel = "surnameLabel"
            static var surnameValueLabel = "surnameValueLabel"
            static var countLabel = "countLabel"
            static var countValueLabel = "countValueLabel"
            static var dobLabel = "dobLabel"
            static var dobValueLabel = "dobValueLabel"
        }
    }

    let nameLabel: UILabel
    let nameValueLabel: UILabel
    let surnameLabel: UILabel
    let surnameValueLabel: UILabel
    let countLabel: UILabel
    let countValueLabel: UILabel
    let dobLabel: UILabel
    let dobValueLabel: UILabel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        //nameLabel
        nameLabel = UILabel()
        nameLabel.font = UIFont.appBoldFont(ofSize: ViewTraits.fontMedium)
        nameLabel.textColor = .appWhite
        nameLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel

        //nameValueLabel
        nameValueLabel = UILabel()
        nameValueLabel.font = UIFont.appFont(ofSize: ViewTraits.fontMedium)
        nameValueLabel.textColor = .appLightGray
        nameValueLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel

        //surnameLabel
        surnameLabel = UILabel()
        surnameLabel.font = UIFont.appBoldFont(ofSize: ViewTraits.fontMedium)
        surnameLabel.textColor = .appWhite
        surnameLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel

        //surnameValueLabel
        surnameValueLabel = UILabel()
        surnameValueLabel.font = UIFont.appFont(ofSize: ViewTraits.fontMedium)
        surnameValueLabel.textColor = .appLightGray
        surnameValueLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel

        //countLabel
        countLabel = UILabel()
        countLabel.font = UIFont.appBoldFont(ofSize: ViewTraits.fontMedium)
        countLabel.textColor = .appWhite
        countLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel

        //countValueLabel
        countValueLabel = UILabel()
        countValueLabel.font = UIFont.appFont(ofSize: ViewTraits.fontMedium)
        countValueLabel.textColor = .appLightGray
        countValueLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel

        //dobLabel
        dobLabel = UILabel()
        dobLabel.font = UIFont.appBoldFont(ofSize: ViewTraits.fontMedium)
        dobLabel.textColor = .appWhite
        dobLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel

        //dobValueLabel
        dobValueLabel = UILabel()
        dobValueLabel.font = UIFont.appFont(ofSize: ViewTraits.fontMedium)
        dobValueLabel.textColor = .appLightGray
        dobValueLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        backgroundColor = .appBlack

        // Add subviews
        contentView.addSubviewsForAutolayout(subviews: [nameLabel,
                                                        nameValueLabel,
                                                        surnameLabel,
                                                        surnameValueLabel,
                                                        countLabel,
                                                        countValueLabel,
                                                        dobLabel,
                                                        dobValueLabel])
        // Add constraints
        addCustomConstraints()
    }

    override func prepareForReuse() {

        super.prepareForReuse()

        nameLabel.text = ""
        nameValueLabel.text = ""
        surnameLabel.text = ""
        surnameValueLabel.text = ""
        countLabel.text = ""
        countValueLabel.text = ""
        dobLabel.text = ""
        dobValueLabel.text = ""
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addCustomConstraints() {

        NSLayoutConstraint.activate([

            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ViewTraits.cellMargins.left),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ViewTraits.cellMargins.top),
            nameLabel.widthAnchor.constraint(equalToConstant: ViewTraits.labelWidth),

            nameValueLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: ViewTraits.innerMargin),
            nameValueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ViewTraits.cellMargins.top),
            nameValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ViewTraits.cellMargins.right),

            surnameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ViewTraits.cellMargins.left),
            surnameLabel.topAnchor.constraint(equalTo: nameValueLabel.bottomAnchor, constant: ViewTraits.vMargin),
            surnameLabel.widthAnchor.constraint(equalToConstant: ViewTraits.labelWidth),

            surnameValueLabel.leadingAnchor.constraint(equalTo: surnameLabel.trailingAnchor, constant: ViewTraits.innerMargin),
            surnameValueLabel.topAnchor.constraint(equalTo: nameValueLabel.bottomAnchor, constant: ViewTraits.vMargin),
            surnameValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ViewTraits.cellMargins.right),

            countLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ViewTraits.cellMargins.left),
            countLabel.topAnchor.constraint(equalTo: surnameValueLabel.bottomAnchor, constant: ViewTraits.vMargin),
            countLabel.widthAnchor.constraint(equalToConstant: ViewTraits.labelWidth),

            countValueLabel.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: ViewTraits.innerMargin),
            countValueLabel.topAnchor.constraint(equalTo: surnameValueLabel.bottomAnchor, constant: ViewTraits.vMargin),
            countValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ViewTraits.cellMargins.right),

            dobLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ViewTraits.cellMargins.left),
            dobLabel.topAnchor.constraint(equalTo: countValueLabel.bottomAnchor, constant: ViewTraits.vMargin),
            dobLabel.widthAnchor.constraint(equalToConstant: ViewTraits.labelWidth),

            dobValueLabel.leadingAnchor.constraint(equalTo: dobLabel.trailingAnchor, constant: ViewTraits.innerMargin),
            dobValueLabel.topAnchor.constraint(equalTo: countValueLabel.bottomAnchor, constant: ViewTraits.vMargin),
            dobValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ViewTraits.cellMargins.right),
            dobValueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -ViewTraits.cellMargins.bottom)])
    }
}
