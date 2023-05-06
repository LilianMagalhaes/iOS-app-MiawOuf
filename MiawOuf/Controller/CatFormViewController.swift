//
//  CatFormViewController.swift
//  MiawOuf
//
//  Created by Lilian MAGALHAES on 2023-03-17.
//

import UIKit

class CatFormViewController: UIViewController {
    @IBOutlet weak var catNameTextField: UITextField!
    @IBOutlet weak var catPhoneTextField: UITextField!
    @IBOutlet weak var catRacePickerView: UIPickerView!
    @IBOutlet weak var catGenderSegmentControl: UISegmentedControl!
    @IBOutlet weak var catMajoritySwitch: UISwitch!
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        catNameTextField.resignFirstResponder()
       catPhoneTextField.resignFirstResponder()
    }
    
    @IBAction func catFormValidate(_ sender: Any) {
        let pet = createPetObject()
        checkPetStatus(pet)
    }
    private func checkPetStatus(_ pet: Pet) {
        switch pet.status {
        case .accepted:
            performSegue(withIdentifier: "segueToCatSuccess", sender: pet)
        case .rejected(let error):
            presentAlert(with: error)
        }
    }
    private func presentAlert(with error: String){
        let alert: UIAlertController = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func createPetObject() -> Pet {
        let name = catNameTextField.text
        let phone = catPhoneTextField.text
        let hasMajority = catMajoritySwitch.isOn
        let gender: Pet.Gender = (catGenderSegmentControl.selectedSegmentIndex == 0) ? .male : .female
        let raceIndex = catRacePickerView.selectedRow(inComponent: 0)
        let race = catRaces[raceIndex]
        return Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToCatSuccess" {
            let catSuccessVC = segue.destination as? CatSuccessViewController
            let pet = sender as? Pet
            catSuccessVC?.pet = pet
        }
    }
}
    
extension CatFormViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catRaces.count
    }
}

extension CatFormViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catRaces[row]
    }
}
