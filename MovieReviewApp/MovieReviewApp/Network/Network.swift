//
//  Network.swift
//  MovieReviewApp
//
//  Created by Ahmet Yasin Kayhan on 7.01.2022.
//

import Foundation
import Alamofire
class Network{
    
    static func getMovieData(complationHandler:@escaping (MovieResponse)->(), errorHandler:@escaping (String)->()){
        AF.request("https://www.mockachino.com/a480dfa4-3d29-42/getMovieList").responseDecodable { (response:AFDataResponse<MovieResponse>) in
            switch response.result{
            case .success(let movieResponse):
                complationHandler(movieResponse)
            case .failure(let error):
                errorHandler(error.localizedDescription)
                print(error)
                break
            }
        }
    }
}


