//
//  AuthRequestBody.swift
//  MovieReviewApp
//
//  Created by Ahmet Yasin Kayhan on 9.01.2022.
//

import Foundation
struct AuthRequestBody: Codable {
    let mail, password, request_token : String?
}
