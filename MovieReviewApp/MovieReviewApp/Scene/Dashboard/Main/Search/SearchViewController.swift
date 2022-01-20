//
//  SearchViewController.swift
//  MovieReviewApp
//
//  Created by Ahmet Yasin Kayhan on 3.01.2022.
//

import UIKit
import SafariServices
import Kingfisher

class SearchViewController: UIViewController {

    @IBOutlet weak var clvSearchView: UICollectionView!
    @IBOutlet weak var field: UITextField!
    var mainList: [Movielist] = []
    var fakeList: [Movielist] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clvSearchView.dataSource = self
        self.clvSearchView.delegate = self
        clvSearchView.reloadData()
        Network.getMovieData { Result in
            self.mainList = Result.movielist
        } errorHandler: { Error in
            fatalError(Error)
        }


        // Do any additional setup after loading the view.
    }
    @IBAction func btnSearchTapped(_ sender: Any) {
        searchMovie(search: field.text ?? "")
    }
    //
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        clvSearchView.cellForItem(at: indexPath)
        let defaultUrl = "https://www.imdb.com/title/tt0409459/"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let url = "https://www.imdb.com/title/\(movieResponse?.movie?.originalTitle ?? defaultUrl )/"
       // let vc = SFSafariViewController(url: URL(string: url)!)
       // present(vc, animated: true)
    }
    func searchMovie(search: String){
        let lowercasedItem=search.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        fakeList.removeAll()
        for i in mainList{
            if (i.originalTitle.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).contains(lowercasedItem)){
                fakeList.append(i)
                
            }
            
            
        }
        clvSearchView.reloadData()
    }
    
    
    


}
extension SearchViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fakeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvSearchView.dequeueReusableCell(withReuseIdentifier: "FindCollectionViewCell", for: indexPath) as! FindCollectionViewCell
        cell.movielist.append(fakeList[indexPath.row])
        
        cell.lblMovieName.text = fakeList[indexPath.row].originalTitle

        let str = "https://image.tmdb.org/t/p/w500\(fakeList[indexPath.row].posterPath ?? "" )"
        cell.imgMovie.kf.setImage(with: URL(string:str), placeholder: nil, options: nil, completionHandler: nil)
        
        return cell
    }
}
