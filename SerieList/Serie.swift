//
//  Serie.swift
//  SerieList
//
//  Created by Aluno Mack on 11/09/19.
//  Copyright © 2019 Aluno Mack. All rights reserved.
//

class Serie {
    var nome:String
    var gender:String
    var episodes:Int
    var watched:Int
    
    init(_ n: String, _ gender: String, episodes: Int, watched: Int){
        self.nome = n;
        self.episodes = episodes;
        self.watched = watched;
        self.gender = gender;
    }
    
    func isFinished() -> Bool {
        return watched >= episodes;
    }
    
    func addWatched(episodes: Int){
        self.watched += episodes
    }
}
