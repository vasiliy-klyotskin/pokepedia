//
//  PokemonListMockLoader.swift
//  Pokepedia-iOS-AppTests
//
//  Created by Василий Клецкин on 7/12/23.
//

import UIKit
import Combine
import Pokepedia

final class PokemonListMockLoader {
    var loadListCallCount: Int { listRequests.count }
    var listRequests = [PassthroughSubject<PokemonList, Error>]()
    
    var imageUrls = [URL]()
    var imageRequests = [PassthroughSubject<ListPokemonItemImage, Error>]()
    
    func load() -> AnyPublisher<PokemonList, Error> {
        let request = PassthroughSubject<PokemonList, Error>()
        listRequests.append(request)
        return request.eraseToAnyPublisher()
    }
    
    func loadImage(for url: URL) -> AnyPublisher<ListPokemonItemImage, Error> {
        let request = PassthroughSubject<ListPokemonItemImage, Error>()
        imageUrls.append(url)
        imageRequests.append(request)
        return request.eraseToAnyPublisher()
    }
    
    func completeImageLoading(with image: ListPokemonItemImage? = nil, at index: Int) {
        let defaultImage = UIImage.make(withColor: .blue).pngData()!
        imageRequests[index].send(image ?? defaultImage)
        imageRequests[index].send(completion: .finished)
    }
    
    func completeImageLoadingWithError(at index: Int) {
        imageRequests[index].send(completion: .failure(anyNSError()))
    }
    
    func completeListLoading(with list: PokemonList = [], at index: Int) {
        listRequests[index].send(list)
        listRequests[index].send(completion: .finished)
    }
    
    func completeListLoadingWithError(at index: Int) {
        listRequests[index].send(completion: .failure(anyNSError()))
    }
}
