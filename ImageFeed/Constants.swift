//
//  Constants.swift
//  ImageFeed
//
//  Created by Аркадий Червонный on 17.11.2025.
//

import Foundation

enum Constants {
    static let accessKey: String = "dBdF9_tkvhpipepXx_JIP97VkJInlupMk5GvjlQj8Jk"
    static let secretKey: String = "kzeyQwtEILavzk8bOlzLuE_Up-C68HNjubbjoQQffHE"
    static let redirectURI: String = "urn:ietf:wg:oauth:2.0:oob"
    
    static let accessScope: String = "public+read_user+write_likes"
    
    static let defaultBaseURL: URL = URL(string: "https://api.unsplash.com")!
}
