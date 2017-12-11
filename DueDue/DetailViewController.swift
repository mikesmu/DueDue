//
//  DetailViewController.swift
//  DueDue
//
//  Created by Michal Smulski on 06/12/2017.
//  Copyright © 2017 msmulski. All rights reserved.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    private var productVariable = PublishSubject<Product>()
    public var productObservable: Observable<Product> {
        return productVariable.asObservable()
    }
    
    public static func create() -> DetailViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as! DetailViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addProduct()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        productVariable.onCompleted()
    }
    
    private func addProduct() {
        let product = Product(name: "A book",
                              category: .book,
                              image: nil,
                              barCode: BarCode(number: 0, image: nil),
                              manufacturer: "",
                              desc: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: { [weak self] in
            guard let `self` = self else { return }
            self.productVariable.onNext(product)
            self.dismiss(animated: true, completion: nil)
        })
    }
}

