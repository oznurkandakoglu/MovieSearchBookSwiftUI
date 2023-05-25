
import SwiftUI

struct MovieListView: View {

    @ObservedObject var movieListViewModel : MovieListViewModel
    
    init() {
        self.movieListViewModel = MovieListViewModel()
        self.movieListViewModel.doMovieSearch(movieName: "pulp")
    }
    
    var body: some View {
        VStack {
            List(movieListViewModel.movies, id:\.imbdId){ movie in
                HStack{
                    Image("placeholder")
                        .resizable()
                        .frame(width: 100, height: 150)
                        
                    VStack (alignment: .leading){
                        Text(movie.title)
                            .font(.title3)
                            .foregroundColor(.blue)
                        Text(movie.year)
                        
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
