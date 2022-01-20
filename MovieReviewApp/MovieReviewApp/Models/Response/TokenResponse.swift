//
//  Login.swift
//  MovieReviewApp
//
//  Created by Ahmet Yasin Kayhan on 8.01.2022.
//

import Foundation
struct TokenResponse: Codable {
    let success: Bool?
    let expiresAt, requestToken: String?
    let statusCode: Int?
    let statusMessage: String?

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

