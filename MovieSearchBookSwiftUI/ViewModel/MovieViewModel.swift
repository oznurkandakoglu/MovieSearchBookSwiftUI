
import Foundation
import SwiftUI
class MovieListViewModel : ObservableObject{
    
    @Published var movies = [MovieViewModel]()
    
    let downloaderClient = DownloaderClient();
    
    func doMovieSearch(movieName : String){
        downloaderClient.downloadMovie(search: movieName) { result in
            switch result {
                case .success(let movieArray):
                    if let movieArray = movieArray{
                        DispatchQueue.main.async {
                            self.movies = movieArray.map(MovieViewModel.init)
                        }
                        
                    }
                    
                case .failure(let error):
                    print(error)
            }
        }
    }
}

struct MovieViewModel{
    
    let movie : Movie
    
    var title : String{
        movie.title
    }
    
    var poster : String{
        movie.poster
    }
    
    var year : String{
        movie.year
    }
    var imbdId : String{
        movie.imdbId
    }
}
