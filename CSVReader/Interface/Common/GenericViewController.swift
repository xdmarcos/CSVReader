//
//  GenericViewController.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit

class GenericViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()

        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

        DLog("Handle memory warning properly")
    }
}
