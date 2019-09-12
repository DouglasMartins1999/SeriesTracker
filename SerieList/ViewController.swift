//
//  ViewController.swift
//  SerieList
//
//  Created by Aluno Mack on 11/09/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

import UIKit

class SerieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var series:[Serie] = [
        Serie("La Casa de Papel", "Ação", episodes: 8, watched: 8),
        Serie("Altered Carbon", "Ação", episodes: 10, watched: 7)
    ]
    
    func seriesToWatch() -> [Serie] {
        return series.filter { (item) -> Bool in !item.isFinished()}
    }
    
    func seriesWatched() -> [Serie] {
        return series.filter { (item) -> Bool in item.isFinished()}
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0 ? seriesToWatch() : seriesWatched()).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Séries em Andamento" : "Séries Finalizadas";
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SerieCell", for: indexPath) as? SerieTableViewCell {
            if(indexPath.section == 0){
                cell.setSerie(s: seriesToWatch()[indexPath.row])
            } else {
                cell.setSerie(s: seriesWatched()[indexPath.row])
            }
            
            return cell;
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

}

