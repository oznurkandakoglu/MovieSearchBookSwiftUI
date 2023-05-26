
import SwiftUI

struct MovieListView: View {

    @ObservedObject var movieListViewModel : MovieListViewModel
    
    @State var searchMovie = ""
    init() {
        self.movieListViewModel = MovieListViewModel()
        
    }
    
    var body: some View {
       
        NavigationView{
            VStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .padding(.leading)
                    TextField("Search Movie", text: $searchMovie, onCommit: {
                        self.movieListViewModel.doMovieSearch(movieName: searchMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie)
                            
                    }).padding()
                        .textFieldStyle(.roundedBorder)
                    
                }
                
            List(movieListViewModel.movies, id:\.imbdId){ movie in
                NavigationLink {
                    DetailView(imdbId: movie.imbdId)
                } label: {
                    HStack{
                        SpecialImage(url: movie.poster)
                            .frame(width: 90, height: 130)
                                    
                        VStack (alignment: .leading){
                            Text(movie.title)
                                .font(.title3)
                                .foregroundColor(.blue)
                            Text(movie.year)
                                    
                        }
                    }
                }

                
            }.navigationTitle(Text("Movie Book"))
                    
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
