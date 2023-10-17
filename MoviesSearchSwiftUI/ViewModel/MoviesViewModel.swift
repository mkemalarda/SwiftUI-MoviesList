//
//  MoviesViewModel.swift
//  MoviesSearchSwiftUI
//
//  Created by Mustafa Kemal ARDA on 16.10.2023.
//

import Foundation
import SwiftUI

class MoviesListViewModel : ObservableObject {
    
    @Published var movies = [MoviesViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func searchMovies(moviesName: String) {
        downloaderClient.downloadMovies(search: moviesName) { result in
            switch result {
                case .failure(let error):
                    print(error)
                case .success(let moviesArray):
                    if let moviesArray = moviesArray {
                    
                        DispatchQueue.main.async {
                            self.movies = moviesArray.map(MoviesViewModel.init)     // .map  ->  movies'i  moviesViewModel'e dönüştürür

                    }
                }
            }
        }
    }
}

struct MoviesViewModel {
    
    let movies : Movies
    
    var title : String {
        movies.title
    }
    
    var poster : String {
        movies.poster
    }
    
    var year : String {
        movies.year
    }
    
    var imdbId : String {
        movies.imdbId
    }
}


