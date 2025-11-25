//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by Аркадий Червонный on 22.11.2025.
//
import Foundation

final class OAuth2TokenStorage {
    static let shared = OAuth2TokenStorage()
    
    private init() {}
    
    private let tokenKey = "BearerToken"
    
    var token: String? {
        get {
            UserDefaults.standard.string(forKey: tokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tokenKey)
        }
    }
}
