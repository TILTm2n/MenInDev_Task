//
//  GalleryPresenter.swift
//  MenInDev_Test
//
//  Created by Eugene on 19.09.2022.
//

import Foundation
import UIKit

protocol GalleryPresenterProtocol: AnyObject {
    var galleryItems: [GalleryItem] { get set }
    func getGalleryItems()
}

class GalleryPresenter: GalleryPresenterProtocol {
    
    var galleryItems: [GalleryItem] = []
    var networkService: GetAllGalleryNetworkProtocol?
    
    weak var view: GalleryViewProtocol?
    
    init(_ galleryView: GalleryViewProtocol, _ network: GetAllGalleryNetworkProtocol) {
        view = galleryView
        networkService = network
    }
    
    func getGalleryItems() {
        networkService?.fetchGalleryAll(completion: { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let items):
                    self.galleryItems = items
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        })
    }
}
