//
//  FileDetailViewController.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileDetailDisplayLogic: class {

    func displayFileData(viewModel: FileDetail.Data.ViewModel)
}

class FileDetailViewController: GenericViewController {

    var interactor: FileDetailBusinessLogic?
    var router: (FileDetailRoutingLogic & FileDetailDataPassing)?

    private let sceneView = FileDetailView()
    private var viewModel = FileDetail.Data.ViewModel(screenTitle: "",
                                                      headerValues: [],
                                                      datasource: [])

    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup
    private func setup() {

        let viewController = self
        let interactor = FileDetailInteractor()
        let presenter = FileDetailPresenter()
        let router = FileDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle
    override func loadView() {
        view = sceneView
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        let backButton = UIBarButtonItem(image: UIImage.NavigationBar.back,
                                         style: .plain,
                                         target: self,
                                         action: #selector(goBack))
        navigationItem.leftBarButtonItem = backButton
        
        sceneView.tableView.delegate = self
        sceneView.tableView.dataSource = self
        sceneView.tableView.register(FileDetailTableViewCell.self, forCellReuseIdentifier: FileDetailTableViewCell.reuseIdentifier)
        sceneView.tableView.register(FileDetailHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: FileDetailHeaderFooterView.reuseIdentifier)


        askForFileData()
    }

    // MARK: Actions
    @objc func goBack() {
        prepareForGoBack()
    }
}

// MARK: UITableView delegate & datasource
extension FileDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return viewModel.datasource.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: FileDetailTableViewCell.reuseIdentifier, for: indexPath) as? FileDetailTableViewCell {

            return configureCell(cell, forIndexPath: indexPath)
        }

        return UITableViewCell()
    }

    private func configureCell(_ cell: FileDetailTableViewCell, forIndexPath indexPath: IndexPath) -> UITableViewCell {

        guard let issue = viewModel.datasource[safe: indexPath.section] else { return cell }

        cell.nameLabel.text = viewModel.headerValues[safe: FileDetail.Header.name.rawValue] ?? ""
        cell.nameValueLabel.text = issue.name
        cell.surnameLabel.text = viewModel.headerValues[safe: FileDetail.Header.surname.rawValue] ?? ""
        cell.surnameValueLabel.text = issue.surname
        cell.countLabel.text = viewModel.headerValues[safe: FileDetail.Header.count.rawValue] ?? ""
        cell.countValueLabel.text = issue.count
        cell.dobLabel.text = viewModel.headerValues[safe: FileDetail.Header.dob.rawValue] ?? ""
        cell.dobValueLabel.text = issue.dob.toString()

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FileDetailHeaderFooterView.reuseIdentifier) as? FileDetailHeaderFooterView else {

            return FileDetailHeaderFooterView()
        }

        let item = NSLocalizedString("Item", comment: "")
        header.titleLabel.text = String(format: "%@ %d", item, section + 1)

        return header
    }
}

// MARK: Output --- Do something
extension FileDetailViewController {

    func askForFileData() {

        let request = FileDetail.Data.Request()
        interactor?.tryGetFileData(request: request)
    }
}

// MARK: Input --- Display something
extension FileDetailViewController: FileDetailDisplayLogic {

    func displayFileData(viewModel: FileDetail.Data.ViewModel) {

        title = viewModel.screenTitle
        self.viewModel = viewModel

        sceneView.tableView.reloadData()
    }
}

// MARK: Routing --- Navigate next scene
extension FileDetailViewController {

    func prepareForGoBack() {
        router?.navigateBack()
    }
}
