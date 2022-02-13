//
//  Movie.swift
//  MovieSearchApp
//
//  Created by Habibur Rahman on 2/12/22.
//

import Foundation

struct Movie: Decodable {
    let search: [Search]
    
    enum CodingKeys: String, CodingKey {
      case search = "Search"
    }
}

struct Search: Decodable {
    let title: String
    let year: String
    let imdbID: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case poster = "Poster"
        
    }
}

struct MovieDetail: Decodable {
    let title: String
    let year: String
    let released: String
    let runTime: String
    let genre: String
    let director: String
    let actors: String
    let plot: String
    let language: String
    let country: String
    let poster: String
    let imdbRating: String
    
    
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case released = "Released"
        case runTime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case poster = "Poster"
        case imdbRating = "imdbRating"
        

    }
    
}


/*{
  "Title": "Harry Potter and the Deathly Hallows: Part 2",
  "Year": "2011",
  "Rated": "PG-13",
  "Released": "15 Jul 2011",
  "Runtime": "130 min",
  "Genre": "Adventure, Fantasy, Mystery",
  "Director": "David Yates",
  "Writer": "Steve Kloves, J.K. Rowling",
  "Actors": "Daniel Radcliffe, Emma Watson, Rupert Grint",
  "Plot": "Harry, Ron, and Hermione search for Voldemort's remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts.",
  "Language": "English, Latin",
  "Country": "United Kingdom, United States",
  "Awards": "Nominated for 3 Oscars. 46 wins & 94 nominations total",
  "Poster": "https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg",
  "Ratings": [
    {
      "Source": "Internet Movie Database",
      "Value": "8.1/10"
    },
    {
      "Source": "Rotten Tomatoes",
      "Value": "96%"
    },
    {
      "Source": "Metacritic",
      "Value": "85/100"
    }
  ],
  "Metascore": "85",
  "imdbRating": "8.1",
  "imdbVotes": "827,211",
  "imdbID": "tt1201607",
  "Type": "movie",
  "DVD": "11 Nov 2011",
  "BoxOffice": "$381,409,310",
  "Production": "N/A",
  "Website": "N/A",
  "Response": "True"
}
*/
