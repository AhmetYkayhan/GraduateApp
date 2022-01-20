//
//  HomePageViewController.swift
//  MovieReviewApp
//
//  Created by Ahmet Yasin Kayhan on 29.12.2021.
//

import UIKit
import SafariServices
import CoreMedia

class HomePageViewController: UIViewController {


    @IBOutlet weak var clvSecond: UICollectionView!
    @IBOutlet weak var clvHome: UICollectionView!
    
    var movieResponse: [Movielist]?
//    var query = self.movieResponse?.movielist
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clvHome.dataSource = self
        self.clvHome.delegate = self
    
        self.clvSecond.dataSource = self
        self.clvSecond.delegate = self
        
        Network.getMovieData { response in
            self.movieResponse = response.movielist
            self.clvHome.reloadData()
            self.clvSecond.reloadData()
        } errorHandler: { Error in
            fatalError()
        }

        
    
        // Do any additional setup after loading the view.
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let media = movieResponse?[indexPath.row]
//        let url = "https://www.imdb.com/find?\(media?.originalTitle)/"
//        let vc = SFSafariViewController(url: URL(string: url)!)
//        present(vc, animated: true)
//
//    }
//


}
extension HomePageViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == clvSecond){
            return movieResponse?.count ?? 0
        }else{
            return movieResponse?.count ?? 0

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let media = movieResponse?[indexPath.row]
        if(collectionView == clvSecond){
            let cell = clvSecond.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            cell.lblListMovieName.text = media?.originalTitle
            let strChart = "https://image.tmdb.org/t/p/w500\(media?.posterPath ?? "" )"
            cell.imglistMovie.kf.setImage(with: URL(string:strChart), placeholder: nil, options: nil, completionHandler: nil)
            return cell
            
        }else{
            let cell = clvHome.dequeueReusableCell(withReuseIdentifier: "BigChartMovieCollectionViewCell", for: indexPath) as! BigChartMovieCollectionViewCell
            
            cell.lblChartMovieName.text = media?.originalTitle
            let strChart = "https://image.tmdb.org/t/p/w500\(media?.posterPath ?? "" )"
            cell.imgChartMovie.kf.setImage(with: URL(string:strChart), placeholder: nil, options: nil, completionHandler: nil)
            return cell
        }
      
    }
    
    
}
