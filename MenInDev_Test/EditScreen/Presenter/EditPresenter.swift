//
//  EditPresenter.swift
//  MenInDev_Test
//
//  Created by Eugene on 05.10.2022.
//

import Foundation

protocol EditPresenterProtocol: AnyObject {
    var userData: UserInfo? { get set }
    func getProfile()
    func deletePrifole(with id: Int)
}

class EditPresenter: EditPresenterProtocol {
    
    var userData: UserInfo?
    
    var networkService: ProfileNetworkProtocol?
    weak var view: EditViewProtocol?
    
    init(_ editView: EditViewProtocol, _ network: ProfileNetworkProtocol) {
        networkService = network
        view = editView
        getProfile()
    }
    
    func getProfile() {
        networkService?.fetchProfile(completion: { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let data):
                    self.userData = data
                    self.view?.success()
                    print("get data success")
                case .failure(let error):
                    self.view?.failure(error: error)
                    print("get data failure")
                }
            }
        })
    }
    
    func deletePrifole(with id: Int) {
        networkService?.deleteProfile(with: id)
    }
    
}
