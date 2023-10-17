//
//  DetailsView.swift
//  MoviesSearchSwiftUI
//
//  Created by Mustafa Kemal ARDA on 17.10.2023.
//

import SwiftUI

struct DetailsView: View {
    
    let imdbId : String
    
    @ObservedObject var moviesDetailsViewModel = MoviesDetailsViewModel()
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 5 ) {
                
                HStack {
                    Spacer()
                    SpecialImage(url: moviesDetailsViewModel.moviesDetails?.poster ?? "")
                        .cornerRadius(10)
                        .frame(width: 200, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                
                Text(moviesDetailsViewModel.moviesDetails?.title ?? "Show Movies Awards")
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding()
                
                Text("Year : \(moviesDetailsViewModel.moviesDetails?.year ?? "")")
                    .padding()
                
                Text("Plot :\(moviesDetailsViewModel.moviesDetails?.plot ?? "")")
                    .padding()
                
                Text("Director : \(moviesDetailsViewModel.moviesDetails?.director ?? "")")
                    .padding()
                
                Text("Writer : \(moviesDetailsViewModel.moviesDetails?.writer ?? "")")
                    .padding()
                
                Text("Awards : \(moviesDetailsViewModel.moviesDetails?.awards ?? "")")
                    .padding()
                
                
            }
            Spacer()
        }
        
        .onAppear(perform: {
            self.moviesDetailsViewModel.getMoviesDetails(imdbId: imdbId)
        })
    }
}

#Preview {
    DetailsView(imdbId: "test")
}
