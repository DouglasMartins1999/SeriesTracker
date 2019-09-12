//
//  AddSerieTableViewController.swift
//  SerieList
//
//  Created by Aluno Mack on 11/09/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import UIKit

class AddSerieTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let genders:[String] = ["Ação", "Aventura", "Policial", "Comédia", "Suspense", "Mistério", "Terror", "SciFi"]
    var selectedGender:String = ""
    weak var prevController:SerieViewController?
    
    @IBOutlet weak var pickerGender: UIPickerView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var episodesAmount: UITextField!
    @IBOutlet weak var episodesWatched: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGender = genders[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerGender.dataSource = self
        pickerGender.delegate = self
        selectedGender = genders[0]
    }
    
    @IBAction func registerSerie(_ sender: Any) {
        let name = nameField.text ?? ""
        let epsWatch = Int(episodesWatched.text!) ?? 0
        let epsTotal = Int(episodesAmount.text!) ?? 0
        
        let serie:Serie = Serie(name, selectedGender, episodes: epsTotal, watched: epsWatch)
        
        if let prevController = prevController {
            prevController.series.append(serie)
        }
        navigationController?.popViewController(animated: true)
    }
}
