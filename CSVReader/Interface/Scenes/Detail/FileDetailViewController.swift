//
//  FileDetailViewController.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

protocol FileDetailDisplayLogic: class {

    func displaySomething(viewModel: FileDetail.Something.ViewModel)
}

class FileDetailViewController: GenericViewController {

    var interactor: FileDetailBusinessLogic?
    var router: (FileDetailRoutingLogic & FileDetailDataPassing)?

    private let sceneView = FileDetailView()

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

        sceneView.tableView.delegate = self
        sceneView.tableView.dataSource = self
        sceneView.tableView.register(FileDetailTableViewCell.self, forCellReuseIdentifier: FileDetailTableViewCell.reuseIdentifier)
    }
}

// MARK: UITableView delegate & datasource
extension FileDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    private func configureCell(_ cell: FileDetailTableViewCell, forIndexPath indexPath: IndexPath) -> UITableViewCell {

        cell.titleLabel.text = "title"
        return cell
    }
}

// MARK: Output --- Do something
extension FileDetailViewController {

    func doSomething() {

        let request = FileDetail.Something.Request()
        interactor?.doSomething(request: request)
    }
}

// MARK: Input --- Display something
extension FileDetailViewController: FileDetailDisplayLogic {

    func displaySomething(viewModel: FileDetail.Something.ViewModel) {

        //nameTextField.text = viewModel.name
    }
}

// MARK: Routing --- Navigate next scene
extension FileDetailViewController {

    private func prepareForNextScene() {

        //        router?.routeToNextScene()
    }
}
