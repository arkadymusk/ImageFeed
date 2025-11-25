//
//  OAuthTokenResponseBody.swift
//  ImageFeed
//
//  Created by Аркадий Червонный on 22.11.2025.
//

struct OAuthTokenResponseBody: Decodable {
    let accessToken: String
    let tokenType: String
    let scope: String
}
