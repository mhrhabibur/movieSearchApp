//
//  MovieManager.swift
//  MovieSearchApp
//
//  Created by Habibur Rahman on 2/13/22.
//

import Foundation

class MovieManager {
   // "https://www.omdbapi.com/?apikey=3822db5&s=\(movieName)")!
    
    func fetchData(movieName: String, completion: @escaping (Movie?, Error?) -> Void) {
        let url = URL(string: "https://www.omdbapi.com/?apikey=3822db5&s=\(movieName)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            
            if let data = data {
                do {
                    let movie = try JSONDecoder().decode(Movie.self, from: data)
                    completion(movie, nil)
                    
                } catch {
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
    
    
    func fetchDetailData(imdbID: String, completion: @escaping (MovieDetail?, Error?) -> Void) {
        let url = URL(string: "https://www.omdbapi.com/?apikey=3822db5&i=\(imdbID)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            
            if let data = data {
                do {
                    let movie = try JSONDecoder().decode(MovieDetail.self, from: data)
                    completion(movie, nil)
                    
                    
                } catch {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
