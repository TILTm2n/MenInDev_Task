//
//  ProfilePresenter.swift
//  MenInDev_Test
//
//  Created by Eugene on 19.09.2022.
//

import Foundation

protocol ProfilePresenterProtocol {
    var userData: UserInfo? { get set }
    func getProfile()
}

class ProfilePresenter: ProfilePresenterProtocol {
    var userData: UserInfo?
    
    var networkService: ProfileNetworkProtocol?
    weak var view: ProfileViewProtocol?
    
    init(_ profileView: ProfileViewProtocol,_ network: ProfileNetworkProtocol) {
        networkService = network
        view = profileView
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
    
//    func onUpdateUI() {
//
//    }
    
}
