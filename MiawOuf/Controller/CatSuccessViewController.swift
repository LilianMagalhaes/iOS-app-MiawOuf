//
//  CatSuccessViewController.swift
//  MiawOuf
//
//  Created by Lilian MAGALHAES on 2023-03-17.
//

import UIKit

class CatSuccessViewController: UIViewController {
    @IBOutlet weak var catNameLabel: UILabel!
    var pet: Pet?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let catName = pet?.name {
            catNameLabel.text = "\(catName)!"
        } else {
            // handle the case where pet or pet.name is nil
        }
    }
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
}
