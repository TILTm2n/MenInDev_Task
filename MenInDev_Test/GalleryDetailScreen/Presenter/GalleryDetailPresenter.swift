//
//  GalleryDetailPresenter.swift
//  MenInDev_Test
//
//  Created by Eugene on 30.09.2022.
//

import Foundation

protocol GalleryDetailPresenterProtocol: AnyObject {
    var itemId: Int? { get set }
    var galleryItem: GalleryItem? { get set }
    func getGalleryItem()
}

class GalleryDetailPresenter: GalleryDetailPresenterProtocol {
    var itemId: Int?
    var galleryItem: GalleryItem?
    var networkService: GetOneGalleryNetworkProtocol?
    
    weak var view: GalleryDetailViewProtocol?
    
    init(_ galleryDetailView: GalleryDetailViewProtocol, _ network: GetOneGalleryNetworkProtocol, _ item: GalleryItem) {
        view = galleryDetailView
        networkService = network
        //itemId = id
        galleryItem = item
        updateView()
    }
    
    func updateView() {
        view?.onUpdate()
    }
    
    func getGalleryItem() {
        networkService?.fetchOneGallery(with: itemId, completion: { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let item):
                    self.galleryItem = item
                    print("success")
                    //self.view?.success()
                case .failure(let error):
                    print("failure")
                    //self.view?.failure(error: error)
                }
            }
        })
    }
    
}
