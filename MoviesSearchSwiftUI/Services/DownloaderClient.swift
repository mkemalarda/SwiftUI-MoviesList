//
//  DownloaderClient.swift
//  MoviesSearchSwiftUI
//
//  Created by Mustafa Kemal ARDA on 16.10.2023.
//

import Foundation


class DownloaderClient {
    
    func downloadMovies(search: String, completion: @escaping(Result<[Movies]?,DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=bd479c72") else {
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,error == nil else {
                return completion(.failure(.notFoundData))
            }
            guard let moviesAnswer = try? JSONDecoder().decode(ComingMovies.self, from: data) else {
                return completion(.failure(.noWorkData))
            }
            completion(.success(moviesAnswer.movies))
        }
        .resume()
    }
    
    func downloadMoviesDetails(imdbId: String,completion: @escaping(Result<MoviesDetails,DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=bd479c72") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.notFoundData))
            }
            
            guard let comingMoviesDetails = try? JSONDecoder().decode(MoviesDetails.self, from: data) else {
                return completion(.failure(.noWorkData))
            }
            completion(.success(comingMoviesDetails))
        }
        .resume()
    }
}

enum DownloaderError : Error {
    
    case wrongUrl
    case notFoundData
    case noWorkData
    
}
