//
//  MovieDetailViewModel.swift
//  MovieSearchBookSwiftUI
//
//  Created by Tiga  on 26.05.2023.
//

import Foundation
import SwiftUI

class MovieDetailViewModel : ObservableObject {
    @Published var movieDetail : MovieDetailsStruct?
    
    let downloaderClient = DownloaderClient();
    
    func doMovieDeatil(imdbId : String){
        downloaderClient.downloadMovieDetail(imdbId: imdbId) { (result) in
            switch result {
                case .success(let movie):
                DispatchQueue.main.async {
                    self.movieDetail = MovieDetailsStruct(detail: movie!)
                }
                
                        
                case .failure(let error):
                    print(error)
            }
        }
       
    }
}

struct MovieDetailsStruct{
    let detail : MovieDetail
    
    var title : String{
        detail.title
    }
    var poster : String {
        detail.poster
    }
    var year : String {
        detail.year
    }
    var imdbId : String {
        detail.imdbId
    }
    var director : String {
        detail.director
    }
    var writer : String {
        detail.writer
    }
    var awards : String {
        detail.awards
    }
    var plot : String {
        detail.plot
    }
}
