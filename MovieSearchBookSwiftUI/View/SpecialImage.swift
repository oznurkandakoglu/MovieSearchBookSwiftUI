//
//  PrivateImage.swift
//  MovieSearchBookSwiftUI
//
//  Created by Tiga  on 26.05.2023.
//

import SwiftUI

struct SpecialImage: View {
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url : String) {
        self.url = url
        self.imageDownloaderClient.downloadImage(url : self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImage{
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
            
        } else {
            return Image("placeHolder")
                .resizable()
        }
    }
    
}

struct PrivateImage_Previews: PreviewProvider {
    static var previews: some View {
        SpecialImage(url : "https://c8.alamy.com/comp/F762XE/film-movie-poster-of-titanic-F762XE.jpg")
    }
}
