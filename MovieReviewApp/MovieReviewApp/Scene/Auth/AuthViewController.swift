//
//  ViewController.swift
//  MovieReviewApp
//
//  Created by Ahmet Yasin Kayhan on 21.12.2021.
//API Key: 113663bdd416621999d74732a21390af
//https://api.themoviedb.org/3/movie/550?api_key=113663bdd416621999d74732a21390af


import UIKit
import Lottie
import Alamofire
import IQKeyboardManagerSwift

class AuthViewController: UIViewController {
    

 
    @IBOutlet weak var movie: AnimationView!
    
    @IBOutlet weak var txtNickorEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movie.contentMode = .scaleAspectFit
        movie.loopMode = .loop
        movie.animationSpeed = 0.7
        movie.play()
        
    }


    @IBAction func btnLoginTapped(_ sender: Any) {
        
        //https://api.themoviedb.org/3/authentication/token/new?api_key=113663bdd416621999d74732a21390af
        AF.request("https://api.themoviedb.org/3/authentication/token/new?api_key=113663bdd416621999d74732a21390af").responseDecodable { (response:AFDataResponse<TokenResponse>) in
            switch response.result {
            case.success(let movieResponse):
                TokenShared.shared.token = movieResponse.requestToken
                self.sendRequest()
            case .failure(let error):
                fatalError()
                break
            }
        }
        
        
        var mail = txtNickorEmail.text ?? "Bekirtura@mailcom"
        var password = txtPassword.text ?? "CourseWissen"

               
    }
    func sendRequest(){
        //
        let headers: HTTPHeaders = [
            "Accept": "application.json"
        ]
        var login = AuthRequestBody.init(mail: txtNickorEmail.text, password: txtPassword.text, request_token: TokenShared.shared.token ?? "")
        AF.request("https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=113663bdd416621999d74732a21390af", method: .post, parameters:login, encoder: .json, headers: headers).responseDecodable { (response: AFDataResponse<TokenResponse>) in
            switch response.result{
            case .success(let response):
                if(response.success ?? false){
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController;
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
            case .failure(let error):
                fatalError()
                break
            }
        }
    }
}

