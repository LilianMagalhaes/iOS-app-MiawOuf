//
//  DogFormViewController.swift
//  MiawOuf
//
//  Created by Lilian MAGALHAES on 2023-03-17.
//

import UIKit

class DogFormViewController: UIViewController {
    var dog: Pet!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var dogMajoritySwitch: UISwitch!
    @IBOutlet weak var dogGenderSegmentControl: UISegmentedControl!
    @IBOutlet weak var dogRacePickerView: UIPickerView!
}

//MARK: Keyboard
extension DogFormViewController: UITextFieldDelegate {
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
      }
}

//MARK: DogForm Validation

extension DogFormViewController{
    @IBAction func dogFormValidate(_ sender: Any) {
        let pet = createPetObject()
        checkPetStatus(pet)
    }
    private func createPetObject() -> Pet {
        let name = nameTextField.text
        let phone = phoneTextField.text
        let hasMajority = dogMajoritySwitch.isOn
        let gender: Pet.Gender = (dogGenderSegmentControl.selectedSegmentIndex == 0) ? .male : .female
        let raceIndex = dogRacePickerView.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        return Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
    }
    private func checkPetStatus(_ pet: Pet) {
        switch pet.status {
        case .accepted:
            performSegue(withIdentifier: "segueToDogSuccess", sender: pet)
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
}
    
    //MARK: DogForm Navigation
extension DogFormViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDogSuccess" {
            let dogSuccessVC = segue.destination as? DogSuccessViewController
            let pet = sender as? Pet
            dogSuccessVC?.pet = pet
        }
    }
}

//MARK: PickerView
extension DogFormViewController: UIPickerViewDataSource, UIPickerViewDelegate  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
    }
}
    


