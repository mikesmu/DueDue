//
//  MasterViewController.swift
//  DueDue
//
//  Created by Michal Smulski on 06/12/2017.
//  Copyright © 2017 msmulski. All rights reserved.
//

import UIKit
import RxSwift

class MasterViewController: UITableViewController {

    var disposeBag = DisposeBag()
    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(MasterViewController.addProductButtonTapped(sender:)))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @IBAction func addProductButtonTapped(sender: Any) {
        let controller = DetailViewController.create()
        controller.productObservable.subscribe(onNext: { [weak self] product in
            guard let `self` = self else { return }
            self.products.append(product)
            self.tableView.reloadData()
        }, onDisposed: {
            print("disposed")
        })
        .disposed(by: disposeBag)
        present(controller, animated: true, completion: nil)
    }

    // MARK: - Table View

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = products[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
}
