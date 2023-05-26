//
//  DetailView.swift
//  MovieSearchBookSwiftUI
//
//  Created by Tiga  on 26.05.2023.
//

import SwiftUI

struct DetailView: View {
    let imdbId : String
    
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    var body: some View {
        VStack (alignment: .leading){
            
            HStack{
                Spacer()
                SpecialImage(url: movieDetailViewModel.movieDetail?.poster ?? "")
                    .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                
                Spacer()
            }
           
            Text(movieDetailViewModel.movieDetail?.title ?? "")
                .font(.title).padding()
                .foregroundColor(.blue)
            
            Text(movieDetailViewModel.movieDetail?.plot ?? "")
                .padding()
            
            Text("Director: \(movieDetailViewModel.movieDetail?.director ?? "")")
                .padding()
            Text("Writer: \(movieDetailViewModel.movieDetail?.writer ?? "")")
                .padding()
            Text("Awards: \(movieDetailViewModel.movieDetail?.awards ?? "")")
                .padding()
            Text("Year: \(movieDetailViewModel.movieDetail?.year ?? "")")
                .padding()
            Spacer()

        }.onAppear {
            self.movieDetailViewModel.doMovieDeatil(imdbId: imdbId)
        }
}
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}

