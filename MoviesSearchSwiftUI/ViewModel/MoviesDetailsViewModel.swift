//
//  MoviesDetailsViewModel.swift
//  MoviesSearchSwiftUI
//
//  Created by Mustafa Kemal ARDA on 17.10.2023.
//

import Foundation
import SwiftUI

class MoviesDetailsViewModel : ObservableObject {
    
    @Published var moviesDetails : MoviesDetailsViewModel2?
    
    let downloaderClient = DownloaderClient()
    
    func getMoviesDetails(imdbId : String) {
        
        downloaderClient.downloadMoviesDetails(imdbId: imdbId) { result in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let moviesDetails):
                DispatchQueue.main.async {
                    self.moviesDetails = MoviesDetailsViewModel2(details: moviesDetails)
                }
            }
        }
    }
}

struct MoviesDetailsViewModel2 {
    
    let details : MoviesDetails
    
    var title : String {
        details.title
    }
    
    var poster : String {
        details.poster
    }
    
    var year : String {
        details.year
    }
    
    var imdbId : String {
        details.imdbId
    }
    
    var director : String {
        details.director
    }
    
    var writer : String {
        details.writer
    }
    
    var awards : String {
        details.awards
    }
    
    var plot : String {
        details.plot
    }
}


