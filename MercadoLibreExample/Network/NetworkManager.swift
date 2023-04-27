//
//  NetworkManager.swift
//  MercadoLibreExample
//
//  Created by Sebastian Vicario on 24/04/2023.
//

import Alamofire

enum NetworkError: Error {
    case invalidURL
}

enum Result<T> {
    case success(T)
    case failure(Error)
}


class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "https://api.mercadolibre.com/sites/MLA/"
    
    
    private static func getURL(path: String) -> URL?{
        if let encodedPath = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            return URL(string: encodedPath)
        } else {
            return nil
        }
    }
    
    
    private func fetch<T: Decodable>(url: URL, completion: @escaping (Result<T>) -> Void) {
        AF.request(url){ $0.timeoutInterval = 4 }.validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private static func getCategoriesURL() -> URL? {
        return NetworkManager.getURL(path: "\(NetworkManager.baseURL)categories")
    }
    
    
    private static func getCategoryURL(category: String) -> URL? {
       return NetworkManager.getURL(path: "\(NetworkManager.baseURL)search?category=\(category)")
   }
    
    private static func getSearchURL(text: String) -> URL? {
       return NetworkManager.getURL(path: "\(NetworkManager.baseURL)search?q=\(text)")
   }
    
    func fetchCategories(completion: @escaping (Result<[CategoryResult]>) -> Void) {
        guard let url = NetworkManager.getCategoriesURL() else { return completion(.failure(NetworkError.invalidURL)) }
        return fetch(url: url, completion: completion)
    }
    
    func fetchSearch(search: String, completion: @escaping (Result<SearchResult>) -> Void) {
        guard let url = NetworkManager.getSearchURL(text: search) else { return completion(.failure(NetworkError.invalidURL)) }
        return fetch(url: url, completion: completion)
    }
    
    func fetchCategoryResult(category: String, completion: @escaping (Result<SearchResult>) -> Void) {
        guard let url = NetworkManager.getCategoryURL(category: category) else { return completion(.failure(NetworkError.invalidURL)) }
        return fetch(url: url, completion: completion)
    }
    
}
