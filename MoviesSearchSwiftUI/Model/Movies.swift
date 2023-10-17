//
//  Movies.swift
//  MoviesSearchSwiftUI
//
//  Created by Mustafa Kemal ARDA on 13.10.2023.
//

import Foundation

struct Movies : Codable {
    
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    // api' de verilen kelimeleri kodlara eşleştirmeyi sağlar
    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
        
    }
}

struct ComingMovies : Codable {
    
    let movies : [Movies]
    
    // "movies" ile "search" verilerini eşleştirdik
    private enum CodingKeys : String,CodingKey {
        case movies = "Search"
        
    }
    
}

