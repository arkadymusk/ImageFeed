//
//  OAuth2Service.swift
//  ImageFeed
//
//  Created by Аркадий Червонный on 20.11.2025.
//
import Foundation

final class OAuth2Service {
    static let shared = OAuth2Service()
    
    private init() {}
    
    private let urlSession = URLSession.shared
    private let tokenStorage = OAuth2TokenStorage.shared
    
    private func makeOAuthTokenRequest(code: String) -> URLRequest? {
        guard var urlComponents = URLComponents(string: "https://unsplash.com/oauth/token") else { return nil }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.accessKey),
            URLQueryItem(name: "client_secret", value: Constants.secretKey),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
        ]
        
        guard let authTokenUrl = urlComponents.url else {
            return nil
        }

        var request = URLRequest(url: authTokenUrl)
        request.httpMethod = "POST"
        return request
    }
    
    func fetchOAuthToken(code: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let request = makeOAuthTokenRequest(code: code) else {
            print("❌ Не удалось создать запрос /oauth/token")
            completion(.failure(NetworkError.invalidRequest))
            return
        }
        
        let task = URLSession.shared.data(for: request) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                do {
                    let body = try JSONDecoder().decode(OAuthTokenResponseBody.self, from: data)
                    let token = body.accessToken
                    
                    self.tokenStorage.token = token
                    
                    completion(.success(token))
                } catch {
                    print("❌ Decoding error:", error)
                    completion(.failure(NetworkError.decodingError(error)))
                }
            case .failure(let error):
                if let networkError = error as? NetworkError {
                    switch networkError {
                    case .httpStatusCode(let statusCode):
                        print("❌ HTTP error, status code:", statusCode)
                    case .urlRequestError(let underlying):
                        print("❌ URL request error:", underlying)
                    case .urlSessionError:
                        print("❌ URLSession error")
                    case .invalidRequest:
                        print("❌ Invalid request")
                    case .decodingError(let decodingError):
                        print("❌ Decoding error:", decodingError)
                    }
                } else {
                    print("❌ Unknown error:", error)
                }
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
}
