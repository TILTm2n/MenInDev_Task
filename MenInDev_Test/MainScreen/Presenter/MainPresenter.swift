//
//  Presenter.swift
//  MenInDev_Test
//
//  Created by Eugene on 19.09.2022.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    var posts: [Post] { get set }
    var stories: [Story] { get set }
    func getPosts()
    func getStories()
}

class MainPresenter: MainPresenterProtocol {
    
    var posts: [Post] = []
    var stories: [Story] = []
    
    weak var view: MainViewProtocol?
    var storyNetworkService: StoryNetworkProtocol?
    var postNetworkService: GetPostsNetworkProtocol?
    
    required init(_ mainView: MainViewProtocol, _ postNetwork: GetPostsNetworkProtocol, _ storyNetwork: StoryNetworkProtocol) {
        view = mainView
        storyNetworkService = storyNetwork
        postNetworkService = postNetwork
        getPosts()
        getStories()
    }
    
    func getPosts() {
        postNetworkService?.fetchPosts(completion: { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let posts):
                    self.posts = posts
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                    print("main presenter posts \(error)")
                }
            }
        })
    }
    func getStories() {
        storyNetworkService?.getStories(completion: { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let stories):
                    self.stories = stories
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                    print("main presenter stories \(error)")
                }
            }
        })
    }
    
}
