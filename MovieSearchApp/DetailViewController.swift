//
//  DetailViewController.swift
//  MovieSearchApp
//
//  Created by Habibur Rahman on 2/12/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var posterView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var runTimeLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var actorsLabel: UILabel!
    @IBOutlet var plotLabel: UILabel!
    
    var posterImage: String?
    var movieName: String?
    var rating: String?
    var year: String?
    var runTime: String?
    var genre: String?
    var country: String?
    var director: String?
    var actors: String?
    var plot: String?
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = movieName {
            nameLabel.text = name
           
        }
        
        if let poster = posterImage {
            let url = URL(string: poster)
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url!) {
            DispatchQueue.main.async {
                self.posterView.image = UIImage(data: data)
            }
            }
        }
    }
        
        
        
        
        
        if let ratings = rating {
            ratingLabel.text = "Rating: \(ratings)"
        }
        
        
        if let years = year {
            yearLabel.text = "Year: \(years)"
        }
        
        if let genres = genre {
            genreLabel.text = genres
        }
        
        if let directors = director {
            directorLabel.text = "Director: \(directors)"
        }
        
        if let countryOfOrigin = country {
            countryLabel.text = "Country: \(countryOfOrigin)"
        }
        
        if let cast = actors {
            actorsLabel.text = "Cast: \(cast)"
        }
        
        if let cinemaPlot = plot {
            plotLabel.text = "Plot: \(cinemaPlot)"
        }
        
        if let duration = runTime {
            runTimeLabel.text = "Duration: \(duration)"
        }
        
    }
}
