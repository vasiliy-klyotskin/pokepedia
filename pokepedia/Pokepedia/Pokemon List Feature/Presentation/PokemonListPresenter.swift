//
//  PokemonListPresenter.swift
//  Pokepedia
//
//  Created by Василий Клецкин on 5/28/23.
//

import Foundation

public final class PokemonListPresenter {
    public static var title: String {
        NSLocalizedString(
            "POKEMON_LIST_TITLE",
            tableName: "PokemonList",
            bundle: Bundle(for: Self.self),
            comment: "Title for Pokemon list"
        )
    }
    
    public static func map(item: PokemonListItem) -> ListPokemonItemViewModel {
        .init(
            name: item.name,
            id: item.id,
            physicalType: item.physicalType.name,
            specialType: item.specialType?.name
        )
    }
}
