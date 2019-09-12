//
//  SerieTableViewCell.swift
//  SerieList
//
//  Created by Aluno Mack on 11/09/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import UIKit

class SerieTableViewCell: UITableViewCell {
    @IBOutlet weak var avatar: UIView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var eps: UILabel!
    @IBOutlet weak var avatarLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatar.layer.cornerRadius = avatar.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setSerie(s: Serie){
        self.setName(n: s.nome)
        self.setGender(g: s.gender)
        self.setWatched(w: s.watched)
        
        if(!s.isFinished()) {
            avatar.backgroundColor = UIColor.blue
        }
    }
    
    private func setName(n: String){
        self.nome.text = n
        self.avatarLabel.text = getLabel(n: n)
    }
    
    private func setGender(g: String){
        self.genero.text = "Genero: " + g
    }
    
    private func setWatched(w: Int){
        self.eps.text = "Eps. Assistidos: " + String(w)
    }
    
    private func getLabel(n: String) -> String {
        return n.split(separator: " ")
            .filter { $0.count > 3 }
            .map { $0.prefix(1) }
            .joined(separator: "")
    }
}
