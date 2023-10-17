//
//  ContentView.swift
//  MoviesSearchSwiftUI
//
//  Created by Mustafa Kemal ARDA on 13.10.2023.
//

import SwiftUI

struct MoviesListView: View {
    
    @ObservedObject var moviesListViewModel : MoviesListViewModel
    
    @State var searchMovie = ""
    
    init() {
        self.moviesListViewModel = MoviesListViewModel()
        
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                TextField("Search Movie", text: $searchMovie) {
                    self.moviesListViewModel.searchMovies(moviesName: searchMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie)
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(moviesListViewModel.movies, id: \.imdbId) { movies in
                    
                    NavigationLink(
                        destination: DetailsView(imdbId: movies.imdbId),
                        label: {
                            HStack {
                                
                                SpecialImage(url: movies.poster)
                                    .frame(width: 90, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading) {
                                    Text(movies.title)
                                        .fontWeight(.bold)
                                        .font(.title3)
                                        .foregroundColor(.blue)
               
                                    Text(movies.year)
                                        .foregroundColor(.orange)
                                }
                            }
                        })
                    
                    
                }
                .navigationTitle("Movies List")
                
            }
        }
    }
}

#Preview {
    MoviesListView()
}
