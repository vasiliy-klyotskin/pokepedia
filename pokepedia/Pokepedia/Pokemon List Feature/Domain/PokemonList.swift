//
//  PokemonList.swift
//  Pokepedia
//
//  Created by Василий Клецкин on 5/16/23.
//

import Foundation

public typealias PokemonList = [PokemonListItem]

public struct PokemonListItem: Equatable {
    public let id: String
    public let name: String
    public let imageUrl: URL
    public let physicalType: PokemonListItemType
    public let specialType: PokemonListItemType?
    
    public init(
        id: String,
        name: String,
        imageUrl: URL,
        physicalType: PokemonListItemType,
        specialType: PokemonListItemType?
    ) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.physicalType = physicalType
        self.specialType = specialType
    }
}

public struct PokemonListItemType: Equatable {
    public let color: String
    public let name: String
    
    public init(color: String, name: String) {
        self.color = color
        self.name = name
    }
}
