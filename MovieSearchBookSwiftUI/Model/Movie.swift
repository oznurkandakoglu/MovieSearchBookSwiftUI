
import Foundation

struct Movie : Codable {
    
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct IncomingMovies : Codable {
    
    let movies : [Movie]
    
    private enum CodingKeys : String, CodingKey{
        case movies = "Search"
    }
}
