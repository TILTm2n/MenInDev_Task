//
//  DetailPresenter.swift
//  MenInDev_Test
//
//  Created by Eugene on 22.09.2022.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    var postData: Post? { get set }
    func updateData()
}

class DetailPresenter: DetailPresenterProtocol {
    var postData: Post?
    var networkService: CommentNetworkProtocol?
    
    weak var detailView: DetailViewProtocol?
    
    init(_ view: DetailViewProtocol, _ data: Post, _ network: CommentNetworkProtocol) {
        detailView = view
        postData = data
        networkService = network
        updateData()
    }
    
    func updateData() {
        detailView?.onUpdate(postData)
    }
}
