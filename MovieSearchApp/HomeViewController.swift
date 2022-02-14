//
//  ViewController.swift
//  MovieSearchApp
//
//  Created by Habibur Rahman on 2/12/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let movieManager = MovieManager()
    
    var movieList = [Search]()
    var movieDetail: MovieDetail!
   
    
    var imdbID: String!
    
 
    @IBOutlet var tableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie Search"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchMovie))
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieViewCell
        let name = movieList[indexPath.row]
        cell.movieTitle.text = name.title
        cell.releasedYear.text = name.year
        
        let imageUrl = URL(string: name.poster)!

        let imageData = try! Data(contentsOf: imageUrl)

        cell.moviePoster.image = UIImage(data: imageData)
        
        return cell
    }
    
    @objc func searchMovie() {
        let alertController = UIAlertController(title: "Search Movie", message: .none, preferredStyle: .alert)
        alertController.addTextField()
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        let submitAnswer = UIAlertAction(title: "Search", style: .default) { [weak self, weak alertController] _ in
            guard let answer = alertController?.textFields?[0].text else { return }
            self?.submitSearch(answer: answer)
        }
        alertController.addAction(submitAnswer)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func submitSearch(answer: String) {
        if answer != "" && !answer.hasSuffix(" "){
            
            var myAnswer: String = ""
            
            for char in answer {
                if char.isLetter {
                    myAnswer.append(char)
                } else {
                    break
                }
            }
            
            movieManager.fetchData(movieName: myAnswer){ movie, error in
                if let myMovieList = movie {
                    self.movieList = myMovieList.search
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }

        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let imdbRating = movieList[indexPath.row].imdbID
            
            movieManager.fetchDetailData(imdbID: imdbRating) { movie, error in
                
                if error != nil {
                    return
                }
                
                if let myMovieDetail = movie {
                    self.movieDetail = myMovieDetail
                    
                    vc.movieName = self.movieDetail.title
                    vc.rating = self.movieDetail.imdbRating
                    vc.posterImage = self.movieDetail.poster
                    
                    
                    vc.year = self.movieDetail.year
                    
                    vc.genre = self.movieDetail.genre
                    vc.runTime = self.movieDetail.runTime
                    vc.country = self.movieDetail.country
                    vc.director = self.movieDetail.director
                    vc.plot = self.movieDetail.plot
                    vc.actors = self.movieDetail.actors
                    
                }
            }
            
            
           
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

