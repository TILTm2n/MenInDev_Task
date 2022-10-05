//
//  Presenter.swift
//  MenInDev_Test
//
//  Created by Eugene on 19.09.2022.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    var posts: [Post] { get set }
    func getPosts()
}

class MainPresenter: MainPresenterProtocol {
    
    var posts: [Post] = []
    
    weak var view: MainViewProtocol?
    var networkService: GetPostsNetworkProtocol?
    
    required init(_ mainView: MainViewProtocol, _ network: GetPostsNetworkProtocol) {
        view = mainView
        networkService = network
    }
    
    func getPosts() {
        networkService?.fetchPosts(completion: { result in
            
            DispatchQueue.main.async {
                switch result{
                case .success(let posts):
                    self.posts = posts
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
            
        })
    }
    
}
