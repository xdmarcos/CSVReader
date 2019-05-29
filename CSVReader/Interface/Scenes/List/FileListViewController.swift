//
//  FileListViewController.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileListDisplayLogic: class {

    func displayFileList(viewModel: FileList.Retrieve.ViewModel)
}

class FileListViewController: GenericViewController {

    var interactor: FileListBusinessLogic?
    var router: (FileListRoutingLogic & FileListDataPassing)?

    private let sceneView = FileListView()
    private var viewModel = FileList.Retrieve.ViewModel(screenTitle: "", datasource: [])

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
        let interactor = FileListInteractor()
        let presenter = FileListPresenter()
        let router = FileListRouter()
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

        sceneView.tableView.delegate = self
        sceneView.tableView.dataSource = self
        sceneView.tableView.register(FileListTableViewCell.self, forCellReuseIdentifier: FileListTableViewCell.reuseIdentifier)

        askForFileList()
    }
}

// MARK: UITableView delegate & datasource
extension FileListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return viewModel.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.datasource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: FileListTableViewCell.reuseIdentifier, for: indexPath) as? FileListTableViewCell {

            return configureCell(cell, forIndexPath: indexPath)
        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard viewModel.datasource[safe: indexPath.row] != nil else { return }
        prepareForDetsailScreen(selectedIndex: indexPath.row)
    }

    private func configureCell(_ cell: FileListTableViewCell, forIndexPath indexPath: IndexPath) -> UITableViewCell {

        guard let fileName = viewModel.datasource[safe: indexPath.row] else { return cell }

        cell.titleLabel.text = fileName
        return cell
    }
}

// MARK: Output --- Do
extension FileListViewController {

    func askForFileList() {

        let request = FileList.Retrieve.Request()
        interactor?.tryRetrieveFileList(request: request)
    }
}

// MARK: Input --- Display
extension FileListViewController: FileListDisplayLogic {

    func displayFileList(viewModel: FileList.Retrieve.ViewModel) {

        title = viewModel.screenTitle
        self.viewModel = viewModel
    }
}

// MARK: Routing --- Navigate next scene
extension FileListViewController {

    private func prepareForDetsailScreen(selectedIndex: Int) {

        router?.navigateToDetailView(index: selectedIndex)
    }
}
