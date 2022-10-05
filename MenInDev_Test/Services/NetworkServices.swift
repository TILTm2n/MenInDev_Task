//
//  NetworkService.swift
//  MenInDev_Test
//
//  Created by Eugene on 22.09.2022.
//

import Foundation

class PostNetwork: GetPostsNetworkProtocol {
    
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        let urlString = "https://yakuba.htmlup.ru/api/v1/posts"
        let json: [String: Any] = ["skip": 0, "limit": 10]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else { return }
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer 266|5Y64elbHH7O9TCBx6Id4IN5XyU8cveAx5SNfGMGp", forHTTPHeaderField: "Authorization")
        request.setValue("\(jsonData.count)", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                // TODO: опционал убрать
                let postData = try JSONDecoder().decode(PostData.self, from: data!)
                //print("збс --> \(postData)")
                completion(.success(postData.data))
            } catch {
                //print("не збс --> \(error)")
                completion(.failure(error))
            }
            
        }.resume()
    }
    
}

class DetailNetwork: CommentNetworkProtocol {
    
}

class GalleryNetwork: GetAllGalleryNetworkProtocol {
    func fetchGalleryAll(completion: @escaping (Result<[GalleryItem], Error>) -> Void) {
        let urlString = "https://yakuba.htmlup.ru/api/v1/gallery"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer 266|5Y64elbHH7O9TCBx6Id4IN5XyU8cveAx5SNfGMGp", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(GalleryData.self, from: data!)
                completion(.success(apiResponse.data))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}

class GetOneGalleryNetwork: GetOneGalleryNetworkProtocol {
    func fetchOneGallery(with id: Int?, completion: @escaping (Result<GalleryItem, Error>) -> Void) {
        let urlString = "https://yakuba.htmlup.ru/api/v1/gallery/\(id)"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer 266|5Y64elbHH7O9TCBx6Id4IN5XyU8cveAx5SNfGMGp", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let apiResponse = try JSONDecoder().decode(GalleryDetailData.self, from: data!)
                completion(.success(apiResponse.data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

class ProfileNetwork: ProfileProtocol {
    func fetchProfile(completion: @escaping (Result<UserInfo, Error>) -> Void) {
        let urlString = "https://yakuba.htmlup.ru/api/v1/profile"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer 266|5Y64elbHH7O9TCBx6Id4IN5XyU8cveAx5SNfGMGp", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let apiResponse = try JSONDecoder().decode(User.self, from: data!)
                completion(.success(apiResponse.data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
