//
//  Builder.swift
//  MenInDev_Test
//
//  Created by Eugene on 19.09.2022.
//

import Foundation
import UIKit

class Builder {
    
    static func buildMainModule() -> UIViewController {
        let mainView = MainView()
        let postNetworkSrvice = PostNetwork()
        let storyNetworkSrvice = StoryNetwork()
        let presenter = MainPresenter(mainView, postNetworkSrvice, storyNetworkSrvice)
        mainView.presenter = presenter
        return mainView
    }
    
    static func buildDetailModule(_ post: Post) -> UIViewController {
        let detailView = DetailView()
        let networkService = DetailNetwork()
        let presenter = DetailPresenter(detailView, post, networkService)
        detailView.presenter = presenter
        return detailView
    }
    
    static func buildGalleryModule() -> UIViewController {
        let galleryView = GalleryView()
        let networkService = GalleryNetwork()
        let presenter = GalleryPresenter(galleryView, networkService)
        galleryView.presenter = presenter
        return galleryView
    }
    
    static func buildGalleryDetailModule(with galleryItem: GalleryItem) -> UIViewController {
        let galleryDetailView = GalleryDetailView()
        let networkService = GetOneGalleryNetwork()
        let presenter = GalleryDetailPresenter(galleryDetailView, networkService, galleryItem)
        galleryDetailView.presenter = presenter
        return galleryDetailView
    }
    
    static func buildProfileModule() -> UIViewController {
        let profileView = ProfileView()
        let networkService = ProfileNetwork()
        let presenter = ProfilePresenter(profileView, networkService)
        profileView.presenter = presenter
        return profileView
    }
    
    static func buildEditModule() -> UIViewController {
        let editView = EditView()
        let networkService = ProfileNetwork()
        let presenter = EditPresenter(editView, networkService)
        editView.presenter = presenter
        return editView
    }
    
}
