
import Foundation

class DownloaderClient{
    
    func downloadMovie(search: String, completion: @escaping(Result<[Movie]?, DownloaderError>) -> Void){
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=58796486")
        else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data, error == nil else{
                return completion(.failure(.veriGelmedi))
            }
            
            guard let movieAnswer = try? JSONDecoder().decode(IncomingMovies.self, from: data)
            else{
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(movieAnswer.movies))
        }.resume()
        
    }
    
    func downloadMovieDetail(imdbId : String, completion: @escaping(Result<MovieDetail?, DownloaderError>) -> Void){
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=58796486")
        else {
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data, error == nil else{
                return completion(.failure(.veriGelmedi))
            }
            
            guard let movieDetailAnswer = try? JSONDecoder().decode(MovieDetail.self, from: data)
            else{
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(movieDetailAnswer))
        }.resume()
    }
}

enum DownloaderError: Error{
    case wrongUrl
    case veriIslenemedi
    case veriGelmedi
}
