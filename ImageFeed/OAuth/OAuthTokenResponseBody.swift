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
    
    private enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
            case tokenType = "token_type"
            case scope
        }
}
