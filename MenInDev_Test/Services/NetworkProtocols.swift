//
//  NetworkProtocols.swift
//  MenInDev_Test
//
//  Created by Eugene on 28.09.2022.
//

import Foundation

protocol GetPostsNetworkProtocol: AnyObject {
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void)
}

protocol LikeUnlikePostNetworkProtocol: AnyObject {
    func likePost(with id: Int)
    func unlikePost(with id: Int)
}

protocol PostNetworkProtocol: GetPostsNetworkProtocol, LikeUnlikePostNetworkProtocol { }

protocol AddCommentNetworkProtocol: AnyObject {
    func makeComment(for id: Int, with content: String)
}

protocol CommentNetworkProtocol: AnyObject {
    
}

//MARK: - Gallery

protocol GetAllGalleryNetworkProtocol: AnyObject {
    func fetchGalleryAll(completion: @escaping (Result<[GalleryItem], Error>) -> Void)
}

protocol GetOneGalleryNetworkProtocol: AnyObject {
    func fetchOneGallery(with id: Int?, completion: @escaping (Result<GalleryItem, Error>) -> Void)
}

//MARK: - Profile
protocol GetProfileNetworkProtocol: AnyObject {
    func fetchProfile(completion: @escaping (Result<UserInfo, Error>) -> Void)
}

protocol EditProfileNetworkPritocol: AnyObject {
    func editProfile(_ editData: EditData, completion: @escaping () -> Void) -> Void
}

protocol DeleteProfileNetworkProtocol: AnyObject {
    func deleteProfile(with id: Int) -> Void
}

protocol ProfileNetworkProtocol: GetProfileNetworkProtocol, EditProfileNetworkPritocol, DeleteProfileNetworkProtocol {
    
}
