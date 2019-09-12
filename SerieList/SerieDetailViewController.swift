//
//  SerieDetailViewController.swift
//  SerieList
//
//  Created by Aluno Mack on 12/09/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import UIKit

class SerieDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var watchedLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var serie:Serie = Serie("", "", episodes: 0, watched: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSerie(s: serie)
    }
    
    func setSerie(s: Serie){
        self.setName(n: s.nome)
        self.setGender(g: s.gender)
        self.setTotal(amount: s.episodes)
        self.setWatched(amount: s.watched)
    }
    
    private func setName(n: String){
        nameLabel.text = n
    }
    
    private func setGender(g: String){
        genderLabel.text = "Gênero: " + g;
    }
    
    private func setWatched(amount: Int){
        watchedLabel.text = String(amount) + " episódio" + (amount == 1 ? "" : "s")
    }
    
    private func setTotal(amount: Int){
        totalLabel.text = String(amount) + " episódio" + (amount == 1 ? "" : "s")
    }
}
