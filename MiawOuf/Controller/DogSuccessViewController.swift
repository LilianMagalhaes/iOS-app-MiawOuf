//
//  DogSuccessViewController.swift
//  MiawOuf
//
//  Created by Lilian MAGALHAES on 2023-03-17.
//

import UIKit

class DogSuccessViewController: UIViewController {

    var pet: Pet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let dogName = pet?.name {
            dogNameLabel.text = "\(dogName)!"
        } else {
            // handle the case where pet or pet.name is nil
        }
    }

        @IBAction func dismiss(_ sender: Any) {
            dismiss(animated: true)
        }
    
    
    @IBOutlet weak var dogNameLabel: UILabel!
 

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
