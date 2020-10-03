//
//  MovieDetailsViewController.swift
//  flixter
//
//  Created by Julio Leonardo Aguilar Colon on 10/2/20.
//  Copyright © 2020 julio.aguilar@live.com. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    var movie : [String:Any]!
    var idx: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
//        let movieRating = movie["vote_average"] as? String
        voteLabel.text =  movie["release_date"] as? String

        voteLabel.sizeToFit()
//        print(movieRating)
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        posterView.af.setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
//        let idx = movie["id"] as! String
        
        backdropView.af.setImage(withURL: backdropUrl!)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let cell = sender as! UICollectionViewCell
//        let indexPath = collectionView.indexPath(for: cell)!
//        let movie = movies[indexPath.row]
          // Pass the selected object to the new view controller.
        let VideoViewController = segue.destination as! VideoViewController
          VideoViewController.movie = movie
//        print("https://api.themoviedb.org/3/movie/\(id)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
//        detailsViewController.id = id
    }

}
